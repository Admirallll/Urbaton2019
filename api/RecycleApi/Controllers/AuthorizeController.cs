using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNetCore.Mvc;

namespace RecycleApi.Controllers
{
	[Route("api")]
	public class AuthorizeController : ControllerBase
	{
		public RecycleContext db = new RecycleContext();

		[HttpPost]
		[Route("register")]
		public ActionResult<int> Register([FromBody] User loginInfo)
		{
			var user = db.Users.FirstOrDefault(u => u.Login == loginInfo.Login);
			if (user != null)
				return BadRequest("Login already exist");
			db.Users.Add(loginInfo);

			db.SaveChanges();
			user = db.Users.First(u => u.Login == loginInfo.Login);
			HttpContext.Response.Cookies.Append("userId", user.Id.ToString());
			return user.Id;
		}

		[HttpPost]
		[Route("login")]
		public ActionResult<int> Login([FromBody] LoginInfo loginInfo)
		{
			var user = db.Users.FirstOrDefault(u => u.Login == loginInfo.Login && u.Password == loginInfo.Password);
			if (user == null)
				return BadRequest("Bad login or password");

			HttpContext.Response.Cookies.Append("userId", user.Id.ToString());

			return user.Id;
		}

	}
}
