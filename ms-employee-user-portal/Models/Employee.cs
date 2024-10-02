namespace ms_employee_user_portal.Models
{
    public class Employee
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Position { get; set; }

        public bool IsActive { get; set; }
    }
}
