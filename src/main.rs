use sysinfo::MemoryRefreshKind;
use sysinfo::RefreshKind;
use sysinfo::System;

fn main() {
    let mem_kind = RefreshKind::nothing().with_memory(MemoryRefreshKind::nothing().with_ram());
    let mut system = System::new_with_specifics(mem_kind);
    system.refresh_memory();
    let max_memory = system.cgroup_limits()
      .map(|limits| limits.total_memory)
      .or_else(|| Some(system.total_memory()));
    println!("Max memory: {:?}", max_memory);
}
