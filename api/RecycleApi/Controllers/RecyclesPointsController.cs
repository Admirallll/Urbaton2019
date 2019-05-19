using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace RecycleApi.Controllers
{
	[Route("api/recycle-point")]
	[ApiController]
	public class RecyclesPointsController : ControllerBase
	{
		public RecycleContext db = new RecycleContext();

		[HttpGet]
		public ActionResult<IEnumerable<RecyclePoint>> GetAll()
		{
			var points = db.RecyclePoints;
			return points;
		}

		[HttpGet("{id}")]
		public ActionResult<RecyclePoint> Get(int id)
		{
			return db.RecyclePoints.FirstOrDefault(e => e.Id == id);
		}

		[HttpPost]
		public ActionResult<int> Post([FromBody] RecyclePoint recyclePoint)
		{
			db.RecyclePoints.Add(recyclePoint);
			db.SaveChanges();


			return db.RecyclePoints.Count();
		}

		[Route("edit")]
		[HttpGet]
		public ActionResult AddPoints()
		{
			return File(new FileStream("submit-points.html", FileMode.Open), "text/html");
		}

		[Route("{id}/stat")]
		public ActionResult<UserStatistics> Statistics(int id)
		{
			var pointRecycles = db.RecycleDtos2.Where(recycle => recycle.RecyclePointId == id).ToArray();
			var result = new UserStatistics();
			result.MaterialsCount = new Dictionary<MaterialType, int>();
			result.TotalCount = pointRecycles.Count();
			result.Name = db.RecyclePoints.First(rp => rp.Id == id).Name;
			foreach (var en in Enum.GetValues(typeof(MaterialType)))
			{
				var el = (MaterialType)en;
				result.MaterialsCount[el] = 0;
			}
			foreach (var recycle in pointRecycles.Select(r => r.ToRecycle()))
			{
				foreach (var material in recycle.Materials.Keys)
				{
					result.MaterialsCount[material] = recycle.Materials[material];
				}
			}
			return result;
		}
	}
}
