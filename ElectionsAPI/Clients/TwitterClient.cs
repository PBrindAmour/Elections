using ElectionsAPI.DAL;
using ElectionsAPI.DAL.Models;
using ElectionsAPI.Models;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;

namespace ElectionsAPI.Clients
{
    public class TwitterClient : IMediaClient
    {
        private string _bearerToken;
        private string _baseURL = "https://api.twitter.com/2/users/";
        private int _maxResults = 5;
        private const string format = "yyyy-MM-dd'T'HH:mm:ss.fffK";
        private IConfiguration _configuration;
        public TwitterClient(IConfiguration config)
        {
            _configuration = config;
            _bearerToken = config.GetSection("TwitterBearerToken").Value;
        }
        public async Task<List<Publication>> GetPublicationsAsync(long userId, DateTime dateDebut, DateTime dateFin)
        {
            var url = _baseURL + userId + "/tweets";
            var param = new Dictionary<string, string>()
            {
                {"start_time", dateDebut.ToString(format)},
                {"end_time", dateFin.ToString(format)},
                {"max_results", _maxResults.ToString()},
                {"tweet.fields", "created_at,author_id" }
            };
            Console.WriteLine("GetPublicationAsync -> userId " + userId + "dateDebut = "+ dateDebut + " dateFin = " + dateFin);

            var newUrl = new Uri(QueryHelpers.AddQueryString(url, param));
            List<TwitterPost> twitterPosts = new List<TwitterPost>();
            RootObject completeResponse;
            using (var httpClient = new HttpClient())
            {
                httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _bearerToken);
                while (true)
                {
                    using (var response = await httpClient.GetAsync(newUrl))
                    {
                        var apiResponse = await response.Content.ReadAsStringAsync();
                        completeResponse = JsonConvert.DeserializeObject<RootObject>(apiResponse);

                        var nextToken = completeResponse.Meta.NextToken;
                        twitterPosts.AddRange(completeResponse.posts);
                        if(String.IsNullOrEmpty(nextToken))
                        {
                            break;
                        }
                        param["pagination_token"] = nextToken;
                        newUrl = new Uri(QueryHelpers.AddQueryString(url, param));
                    }
                }
                return GetPublicationList(twitterPosts);
            }
        }

        private List<Publication> GetPublicationList(List<TwitterPost> posts)
        {
            return posts.Select(p => new Publication
            {
                MediaId = 2,
                PublicationMediaId = p.Id,
                MediaUserId = p.UserId,
                Texte = p.Texte,
                PublicationDate = p.Date,
                UrlPublication = GetPublicationUrl(p.UserId.ToString(), p.Id.ToString())
            }).ToList();
            
        }

        public String GetPublicationUrl(string userId, string publicationMediaId)
        {
            return "https://twitter.com/" + userId + "/status/" + publicationMediaId;
        }
    }
}

