using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace RecycleApi.Controllers
{
	[Route("api/codes")]
	[ApiController]
	public class CodesController : ControllerBase
	{
		public RecycleContext db = new RecycleContext();

		[HttpPost]
		[Route("generate")]
		public ActionResult<string> Generate([FromBody] RecycleDto recycleDto)
		{
			recycleDto.IsApproved = false;
			db.RecycleDtos2.Add(recycleDto);
			db.SaveChanges();
			var recycleId = recycleDto.Id;
			var codeString = GenerateCode();
			var codeObject = new Code {CodeId = codeString, RecycleId = recycleId};

			db.Codes.Add(codeObject);
			db.SaveChanges();
			return codeObject.CodeId;
		}

		[Route("send-code")]
		[HttpPost]
		public ActionResult<int> SendCode([FromBody] SendCodeDto input)
		{
			var code = db.Codes.FirstOrDefault(c => c.CodeId == input.Code);
			if (code == null)
				return NotFound();

			var recycle = db.RecycleDtos2.First(r => r.Id == code.RecycleId);

			recycle.UserId = input.UserId;
			recycle.IsApproved = true;
			db.SaveChanges();
			return recycle.ToRecycle().CalculatePoints();
		}

		private string GenerateCode()
		{
			var random = new Random();
			var number = (int)(random.NextDouble() * 1000000);
			return number.ToString().PadLeft(6, '0');
		}
	}
}
