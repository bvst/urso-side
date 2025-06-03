using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using NUnit.Framework;
using NSubstitute;
using Microsoft.AspNetCore.Mvc.Testing;

[TestFixture]
public class SnapshotApiTests
{
    private HttpClient _client = null!; // Ensured proper initialization to avoid nullability issues

    [SetUp]
    public void SetUp()
    {
        var appFactory = new WebApplicationFactory<Program>();
        _client = appFactory.CreateClient();
    }

    [Test]
    public async Task UploadSnapshot_ShouldReturnOk()
    {
        // Arrange
        var content = new MultipartFormDataContent();
        var fileContent = new ByteArrayContent(new byte[] { 0x01, 0x02, 0x03 });
        fileContent.Headers.ContentType = MediaTypeHeaderValue.Parse("image/png");
        content.Add(fileContent, "file", "test.png");

        // Act
        var response = await _client.PostAsync("/api/snapshot/upload", content);

        // Assert
        Assert.That(response.IsSuccessStatusCode, Is.True);
        var responseString = await response.Content.ReadAsStringAsync();
        Assert.That(responseString, Does.Contain("/snapshots/test.png"));
    }

    [Test]
    public async Task UploadSnapshot_ShouldReturnBadRequest_WhenFileIsMissing()
    {
        // Arrange
        var content = new MultipartFormDataContent();

        // Act
        var response = await _client.PostAsync("/api/snapshot/upload", content);

        // Assert
        Assert.That(response.StatusCode, Is.EqualTo(System.Net.HttpStatusCode.BadRequest));
    }
}
