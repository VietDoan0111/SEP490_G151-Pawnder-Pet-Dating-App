using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class PaymentHistory
{
    public int HistoryId { get; set; }

    public int? UserId { get; set; }

    public string? StatusService { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual User? User { get; set; }
}
