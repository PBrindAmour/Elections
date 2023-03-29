namespace ElectionsAPI.Engine.Interfaces
{
    public interface IPublicationMediaEngine
    {
        Task<DateTime?> GetLatestPublicationAsync(short mediaId, long mediaUserId);
        Task GetPostsAsync();
        Task GetPostsPartisAsync(); // On va chercher les posts de Twitter.

        Task NettoyerPosts();
    }

}
