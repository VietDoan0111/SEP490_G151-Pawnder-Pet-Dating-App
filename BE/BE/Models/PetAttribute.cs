using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class PetAttribute
{
    public int AttributePetId { get; set; }

    public string? Name { get; set; }

    public string? TypeValue { get; set; }

    public string? Unit { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<PetCharacteristic> PetCharacteristics { get; set; } = new List<PetCharacteristic>();
}
