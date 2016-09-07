<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
      
       <a type="button" id="button-save" href="<?php echo $save; ?>"  class="btn btn-primary"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></a>
       <a href="<?php echo $cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
      
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>	
      </ul>
      <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>  
       <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      	<table class="table"><tr><td>
        <table class="table">
          <tr>
          <td>Country</td><td><input disabled="true" type="text" name="agent_country" value="<?php echo $agent_country;?>" class="form-control" /></td>
          </tr><tr>
          <td>Country Code</td><td><input disabled="true" type="text" placeholder="" name="agent_country_code" value="<?php echo $agent_country_code; ?>" class="form-control" /></td>
          </tr><tr>
          <td>SCAC</td><td><input disabled="true" type="text" name="agent_scac" value="<?php echo $agent_scac; ?>" class="form-control" /></td>
          </tr>
          <tr>
          <td>Agent Code</td><td><input disabled="true" type="text" name="agent_code" value="<?php echo $agent_code; ?>" class="form-control" /></td>
          </tr>
          
          
          
        </table class ="box">
        </td><td>
        
        <table>
        <tr><td align = "center" colspan ="2">Agency</td>
        <tr><td></td>
        	<td><input type="text" id="agent_name"  name="agent_name" value="<?php echo $agent_name; ?>" class="form-control"  /></td>
        </tr>
        
        <tr><td></td>
        	<td><input type="text" name="agent_address1" value="<?php echo $agent_address1; ?>" class="form-control" /></td>
        </tr>
        
        <tr><td></td>
        	<td><input type="text" name="agent_address2" value="<?php echo $agent_address2; ?>" class="form-control"  /></td>
        	
        </tr>
        
        <tr><td></td>
        	<td><input type="text" name="agent_address3" value="<?php echo $agent_address3; ?>" class="form-control"  /></td>
        	
        </tr>
        
        <tr><td>Phone:</td>
        	<td><input type="text" name="agent_phone" value="<?php echo $agent_phone; ?>" size="20" />  &nbsp;Fax:<input type="text" name="agent_fax" value="<?php echo $agent_fax; ?>" size="17" /></td>
        	
        </tr>
        
        <tr><td>Email:</td>
        	<td><input type="text" name="agent_email" value="<?php echo $agent_email; ?>" class="form-control"   /></td>
        	
        </tr>
        
        <tr><td>Notes:</td>
        	<td><input type="text" name="agent_note" value="<?php echo $agent_note; ?>" class="form-control"  /></td>
        	
        </tr>
        </table>
        </td>
        <td>
        <table>
        <tr>
        <td align = "center" colspan ="2">Statement</td>
        
        </tr>
        <tr>
        	<td colspan = "2"><input type="text" name="agent_statement" value="<?php echo $agent_statement; ?>" size="20" /></td>
        	
        </tr>
        
        <tr>
        <td><input type="checkbox" id="inlineCheckbox2" value="">No Collect</td>
        </tr>
        
        <tr>
        <td><input type="checkbox" id="inlineCheckbox2" value="">No Express</td>
        </tr>

		<tr>
        <td>
        <?php if ($agent_no_door_cfs) { ?>
        <input type="checkbox"  checked = "checked"id="agent_no_door_cfs" value="<?php echo $agent_no_door_cfs; ?>">No Door CFS
          <?php }else{ ?>
        <input type="checkbox" id="agent_no_door_cfs" value="<?php echo $agent_no_door_cfs; ?>">No Door CFS
        <?php } ?>
        </td>
        </tr>
        
        <tr>
        <td>
         <?php if ($agent_cfs_routed) { ?>
        <input type="checkbox" checked = "checked" id="agent_cfs_routed" value="<?php echo $agent_cfs_routed; ?>">Routed CFS
          <?php }else{ ?>
         <input type="checkbox" id="agent_cfs_routed" value="<?php echo $agent_cfs_routed; ?>">Routed CFS
        <?php } ?>
        
        </td>
        </tr>
        <tr>
        <td>
         <?php if ($agent_routed_markup) { ?>
        <input type="checkbox" checked = "checked" id="agent_routed_markup" value="<?php echo $agent_routed_markup; ?>">Routed Premium
         <?php }else{ ?>
          <input type="checkbox" id="agent_routed_markup" value="<?php echo $agent_routed_markup; ?>">Routed Premium
         <?php } ?>
        </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        </table>
        
        </td>
        </tr>
        </table>
    </div>
    
    </div><!---booking-type --->      
	<div>
   
	 <ul id="customer" class="nav nav-tabs nav-justified">
            <li class="active" id = "tab_lcl"><a href="#tab_lcl" data-toggle="tab" >LCL</a></li>
    		<li class="" id="tab_lcl_hbl"><a href="#tab_lcl_hbl" data-toggle="tab" >LCL HBL Agents</a></li>
            <li class="" id="tab_lcl_other"><a href="#tab_lcl_other" data-toggle="tab" >LCL Other</a></li>
     		<li class="" id="tab_lcl_dest"><a href="#tab_lcl_dest" data-toggle="tab" >LCL Dest</a></li>
            <li class="" id="tab_dest"><a href="#tab_dest" data-toggle="tab" >Dest Text</a></li>
            <li class="" id="tab_fcl"> <a href="#tab_fcl" data-toggle="tab" >FCL</a></li>
            <li class="" id="tab_imports"><a href="#tab_imports" data-toggle="tab" >Imports</a></li>
            <li class="" id="tab_emails"><a href="#tab_emails" data-toggle="tab" >emails</a></li>
            <li class="" id="tab_routed"><a href="#tab_routed" data-toggle="tab" >Routed</a></li>
            
            
   </ul>
   
			<div class="tab-content">
				<div class="tab-pane active" id="tab_general">
					  <div class ="tab_general">
						  <div class=".col-lg-12 col-md-12 col-sm-12">
							test
						  </div>
			 		  </div>
			    </div><!--- end tab #tab-general --->     
   <div id="tab_lcl">
   
   </div><!--- end tab lcl --->     
   
   <div id="tab_lcl_hbl">
   
   </div><!--- end tab_lcl_hbl--->  
   
   <div id="tab_lcl_other">
   
   </div><!--- endtab_lcl_other---> 
    
   <div id="tab_lcl_dest">
   
   </div><!--- end tab_lcl_dest--->  
   
   <div id="tab_dest">
   
   </div><!--- end tab_dest--->  
   
   <div id="tab_fcl">
   
   </div><!--- end tab_fcl --->  
   
   <div id="tab_imports">
   
   </div><!--- end tab_imports---> 
    
   <div id="tab_emails">
   
   </div><!--- end tab_emails--->
     
   <div id="tab_routed">
   
   </div><!--- end tab_routed--->       
        
        
      </form>
  
  </div>
</div>
<script type="text/javascript">$('#tabs a').tabs();</script> 
<script type="text/javascript">window.onload(function() {location.reload();});</script>
<?php echo $footer; ?>