using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class AttributePreference
{
    public int AttributePreferencesId { get; set; }

    public string? Name { get; set; }

    public string? TypeValue { get; set; }

    public string? Unit { get; set; }

    public bool? IsActive { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<UserPreference> UserPreferences { get; set; } = new List<UserPreference>();
}
