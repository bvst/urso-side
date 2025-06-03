using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using NUnit.Framework;
using NSubstitute;

[TestFixture]
public class SnapshotServiceTests
{
    private SnapshotService _snapshotService;

    [SetUp]
    public void SetUp()
    {
        _snapshotService = new SnapshotService();
    }

    [Test]
    public async Task UploadSnapshotAsync_ShouldThrowArgumentException_WhenFileIsEmpty()
    {
        // Arrange
        var file = Substitute.For<IFormFile>();
        file.Length.Returns(0);

        // Act & Assert
        var ex = Assert.ThrowsAsync<ArgumentException>(async () =>
            await _snapshotService.UploadSnapshotAsync(file, "uploads"));

        Assert.That(ex.Message, Is.EqualTo("Uploaded file is empty or null."));
    }

    [Test]
    public async Task UploadSnapshotAsync_ShouldCreateFile_WhenFileIsValid()
    {
        // Arrange
        var file = Substitute.For<IFormFile>();
        file.Length.Returns(100);
        file.FileName.Returns("test.png");

        var uploadsFolder = Path.Combine(Path.GetTempPath(), "uploads");
        var filePath = Path.Combine(uploadsFolder, file.FileName);

        using (var stream = new MemoryStream())
        {
            file.OpenReadStream().Returns(stream);

            // Act
            var result = await _snapshotService.UploadSnapshotAsync(file, uploadsFolder);

            // Assert
            Assert.That(result, Is.EqualTo(filePath));
            Assert.That(File.Exists(filePath), Is.True);

            // Cleanup
            File.Delete(filePath);
        }
    }
}