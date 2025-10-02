using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class Report
{
    public int ReportId { get; set; }

    public int? FromUserId { get; set; }

    public int? ToUserId { get; set; }

    public string? Reason { get; set; }

    public string? Status { get; set; }

    public string? Resolution { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual User? FromUser { get; set; }

    public virtual User? ToUser { get; set; }
}
