namespace ElectionsAPI.Engine.Interfaces
{
    public interface IPublicationMediaEngine
    {
        Task<DateTime?> GetLatestPublicationAsync(short mediaId, long mediaUserId);
        Task GetPostsAsync();
    }
}
