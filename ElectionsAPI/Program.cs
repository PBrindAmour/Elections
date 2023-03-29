using ElectionsAPI.Clients;
using ElectionsAPI.DAL;
using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.Engine;
using ElectionsAPI.Engine.Interfaces;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

var config = new ConfigurationBuilder()
    .AddJsonFile("appsettings.json")
    .Build();

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddMemoryCache();
builder.Services.AddScoped<IPublicationMediaStore, PublicationMediaStore>();
builder.Services.AddScoped<IPublicationMediaEngine, PublicationMediaEngine>();
builder.Services.AddScoped<IRechercheStore, RechercheStore>();
builder.Services.AddScoped<IRechercheEngine, RechercheEngine>();
builder.Services.AddScoped<IOutilsAnalyseEngine, OutilsAnalyseEngine>();
builder.Services.AddScoped<IOutilsAnalyseStore, OutilsAnalyseStore>();
builder.Services.AddScoped<INettoyeurTexteEngine, NettoyeurTexteEngine>();
builder.Services.AddScoped<INettoyeurTexteStore, NettoyeurTexteStore>();
builder.Services.AddScoped<IMediaClient, TwitterClient>(); //Seulement Twitter pour l'instant

var connectionString = config.GetSection("ConnectionStrings:ElectionsDB").Value; 
builder.Services.AddDbContext<ElectionContext>(options => options.UseSqlServer(connectionString));
var app = builder.Build();



// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
