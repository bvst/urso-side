var builder = WebApplication.CreateBuilder(new WebApplicationOptions
{
    EnvironmentName = Environments.Production // Set environment to Production for testing
});

var app = builder.Build();

var snapshotService = new SnapshotService();

app.MapPost("/api/snapshot/upload", async (HttpRequest request) =>
{
    try
    {
        if (!request.HasFormContentType || string.IsNullOrEmpty(request.ContentType) || !request.ContentType.Contains("boundary="))
        {
            Console.WriteLine("Invalid or missing content-type boundary detected.");
            return Results.BadRequest("Invalid content type. Expected form data with a boundary.");
        }

        var form = await request.ReadFormAsync();
        if (form == null || form.Files.Count == 0)
        {
            Console.WriteLine("No file uploaded in the request.");
            return Results.BadRequest("No file uploaded.");
        }

        var file = form.Files[0];
        var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "snapshots");

        var filePath = await snapshotService.UploadSnapshotAsync(file, uploadsFolder);

        if (string.IsNullOrEmpty(filePath))
        {
            Console.WriteLine("SnapshotService returned an empty file path.");
            return Results.BadRequest("Failed to upload file.");
        }

        return Results.Ok(new { FilePath = filePath });
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Unhandled Exception: {ex.Message}");
        Console.WriteLine($"Stack Trace: {ex.StackTrace}");
        return Results.Problem("An error occurred while processing the file.", statusCode: 500);
    }
});

app.MapGet("/api/snapshot/view", async () =>
{
    var snapshotPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "snapshots", "snapshot.png");
    if (!File.Exists(snapshotPath))
    {
        return Results.NotFound("Snapshot not found.");
    }

    var fileBytes = await File.ReadAllBytesAsync(snapshotPath);
    return Results.File(fileBytes, "image/png", "snapshot.png");
});

app.Run();
