public class SnapshotService
{
    public async Task<string> UploadSnapshotAsync(IFormFile file, string uploadsFolder)
    {
        try
        {
            if (file == null || file.Length == 0)
            {
                Console.WriteLine("SnapshotService: File is null or empty.");
                return string.Empty; // Return an empty string to indicate failure
            }

            if (!Directory.Exists(uploadsFolder))
            {
                Console.WriteLine("SnapshotService: Uploads folder does not exist. Creating folder.");
                Directory.CreateDirectory(uploadsFolder);
            }

            var fileName = Path.GetFileName(file.FileName); // Ensure only the file name is used
            var filePath = Path.Combine(uploadsFolder, fileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            Console.WriteLine($"SnapshotService: File uploaded successfully to {filePath}.");
            return $"/snapshots/{fileName}"; // Return a relative path
        }
        catch (Exception ex)
        {
            Console.WriteLine($"SnapshotService: Exception occurred - {ex.Message}");
            throw;
        }
    }
}