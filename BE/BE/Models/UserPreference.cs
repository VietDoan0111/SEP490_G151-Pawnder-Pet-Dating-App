using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class UserPreference
{
    public int UserPreferencesId { get; set; }

    public int? UserId { get; set; }

    public int? AttributePreferencesId { get; set; }

    public string? Value { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual AttributePreference? AttributePreferences { get; set; }

    public virtual User? User { get; set; }
}
