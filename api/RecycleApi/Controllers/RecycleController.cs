using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;

namespace RecycleApi.Controllers
{
	[Route("api/recycle")]
	[ApiController]
	public class RecycleController : ControllerBase
	{
		public RecycleContext db = new RecycleContext();

		[HttpGet]
		public ActionResult<IEnumerable<Recycle>> GetAll()
		{
			return db.Recycles;
		}

		[HttpGet("{id}")]
		public ActionResult<Recycle> Get(int id)
		{
			return db.Recycles.FirstOrDefault(e => e.RecycleId == id);
		}

		[HttpPost]
		public void Post([FromBody] Recycle recycle)
		{
			db.Recycles.Add(recycle);
			db.SaveChanges();
		}
	}
}
