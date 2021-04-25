resource snowflake_resource_monitor ded_sandbox_synthetic_monitor {
  name = "sandbox_synthetic_monitor"
  credit_quota = 100
  notify_triggers = [25, 50, 75]
  suspend_triggers = [100]
  suspend_immediate_triggers = [110]
}
