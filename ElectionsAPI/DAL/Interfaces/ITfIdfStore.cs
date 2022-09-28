using ElectionsAPI.Controllers.Models;

namespace ElectionsAPI.DAL.Interfaces
{
    public interface ITfIdfStore
    {
        Task<string> GetTextAsync(short id);
    }
}
