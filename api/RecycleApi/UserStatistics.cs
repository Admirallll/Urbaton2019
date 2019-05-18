using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RecycleApi
{
	public class UserStatistics
	{
		public Dictionary<MaterialType, int> MaterialsCount { get; set; }
		public int TotalCount { get; set; }
	}
}
