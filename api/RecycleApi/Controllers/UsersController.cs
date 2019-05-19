using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;

namespace RecycleApi.Controllers
{
	[Route("api/user")]
	[ApiController]
	public class UsersController : ControllerBase
	{
		public RecycleContext db = new RecycleContext();

		[HttpGet]
		public ActionResult<IEnumerable<User>> GetAll()
		{
			return db.Users;
		}

		[HttpGet("{id}")]
		public ActionResult<User> Get(int id)
		{
			return db.Users.FirstOrDefault(e => e.Id == id);
		}

		[Route("{id}/stat")]
		[HttpGet]
		public ActionResult<UserStatistics> GetStat(int id)
		{
			var userRecycles = db.RecycleDtos2.Where(recycle => recycle.UserId == id).ToArray();
			var result = new UserStatistics();
			result.MaterialsCount = new Dictionary<MaterialType, int>();
			result.TotalCount = userRecycles.Count();
			foreach (var en in Enum.GetValues(typeof(MaterialType)))
			{
				var el = (MaterialType) en;
				result.MaterialsCount[el] = 0;
			}
			foreach (var recycle in userRecycles.Select(r => r.ToRecycle()))
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
