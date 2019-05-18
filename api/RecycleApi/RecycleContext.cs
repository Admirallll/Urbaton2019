using System.Data.Entity;

namespace RecycleApi
{
	public class RecycleContext : DbContext
	{
		public DbSet<RecyclePoint> RecyclePoints { get; set; }
		public DbSet<User> Users { get; set; }
		public DbSet<Recycle> Recycles { get; set; }
	}
}
