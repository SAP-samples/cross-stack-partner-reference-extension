extension using interface i_salesordertp
implementation in class zbp_pra_pse_r_so_bext unique;
extend behavior for SalesOrder
{

action ( authorization : update , features : instance , precheck) zzpra_pse_assign_ps
parameter ZPRA_PSE_ASSIGN_PSE_TO_SO  result [1] $self;

field(readonly) zzpra_pse_ps_id_sdh, zzpra_pse_ps_title_sdh;

 side effects {
    action zzpra_pse_assign_ps affects entity _Item._SalesOrder;
  }
}