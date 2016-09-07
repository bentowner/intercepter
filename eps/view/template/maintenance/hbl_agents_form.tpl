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
      	
        <table class="table">
          <tr>
	          <td>HBL Agent</td>
	          <td>Standard Agent</td>          
          </tr>
           <tr>
          	  <td><input type="text" name="hbl_agent_number" value="<?php echo $hbl_agent_number;?>" class = "form-control" /></td>
           	  <td><input type="text" name="" value="" class = "form-control" /></td>
           	  
	       </tr>
	       
	       <tr><td colspan = "2">Destination Base Agent</td></tr>
	       <tr><td colspan = "2"><input type="text" name="hbl_agent_base" value="<?php echo $hbl_agent_base;?>" class = "form-control" /></td></tr>
	       
	       <tr><td colspan = "2">HBL Agent Name</td></tr>
	       <tr><td colspan = "2"><input type="text" name="hbl_agent_name" value="<?php echo $hbl_agent_name;?>" class = "form-control" /></td></tr>
	       <tr><td colspan = "2"><textarea class = "form-control" ><?php echo $hbl_agent_details;?></textarea></td></tr>
	       <tr><td colspan = "2">Email Address</td></tr>
	       <tr><td colspan = "2"><input type="text" name="hbl_agent_email" value="<?php echo $hbl_agent_email;?>" class = "form-control" /></td></tr>
          
         </table>           
          	
    
    </div><!---booking-type --->      
	
        
      </form>
  	</div>
  </div>
</div>
<script type="text/javascript">$('#tabs a').tabs();</script> 
<script type="text/javascript">window.onload(function() {location.reload();});</script>
<?php echo $footer; ?>