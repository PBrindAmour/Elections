using ElectionsAPI.DAL.Models;

namespace ElectionsAPI.Engine.Interfaces
{
    public interface INettoyeurTexteEngine
    {
        Task NettoyerTextes(short mediaId);
        Task TronquerPublication(short mediaId);
        Task NettoyeTronque(short mediaId);
    }
}
