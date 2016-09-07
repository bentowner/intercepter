<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/stock-status.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
      <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
      
      </div>
    </div>
    <div class="booking-type">
      		<div class="booking-heading">Vessel Information</div>
			
			
    <div class="booking-content">
    <div class="booking-content"><div class= "vessels-info"><?php echo $vessels_name; ?><div></div>
    <br>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      	
        <table class="box">
          <tr>
	          <td colspan = "3">Rotation - <?php echo $rotation;?> </td><td>TT</td><td>Carrier - <?php echo $carrier_name;?></td>
	      </tr>
          
           
           <tr>    
	          <td colspan = "3"><input type="text" name="service" value="<?php echo $service;?>" size="50" /></td>
	          <td><input type="text" name="transit_time" value="<?php echo $transit_time;?>" size="3" /></td>
	          <td><input type="text" name="carrier" value="<?php echo $carrier;?>" size="35" /></td>
	      </tr>
          <tr>
          <td>Sequence</td>
          <td  colspan = "3">Vessel Name</td>
          <td>Voyage</td>
          <td>Actual TT</td>
          </tr>
          <tr>
              <td><input type="text" name="sequence" value="<?php echo $sequence;?>" size="10" /></td>
		  	  <td colspan = "3"><input type="text" name="vessels_name" value="<?php echo $vessels_name;?>" size="50" /></td>
	          <td><input type="text" name="voyage" value="<?php echo $voyage;?>" size="5" /></td>
	          <td><input type="text" name="" value="" size="10" /></td>
		  </tr>
          
          
          <tr>
          <td>Load Port</td>
          <td>Load Date</td>
          <td>Actual ETD</td>
          <td>Un-Load Port</td>
          <td>Un-Load Date</td>
          </tr>
          
          <tr>
          <td><input type="text" name="load_port" value="<?php echo $load_port;?>" size="10" /></td>
	  	  <td><input type="text" name="load_date" value="<?php echo $load_date;?>" size="10" /></td>
	  	  <td><input type="text" name="actual_etd" value="<?php echo $actual_etd;?>" size="10" /></td>
          <td><input type="text" name="unload_port" value="<?php echo $unload_port;?>" size="10" /></td>
		  <td><input type="text" name="unload_date" value="<?php echo $unload_date;?>" size="10" /></td>
		  </tr>
          
          </table>         
            
       <table class="box">
       	 <tr>
       	 <td colspan = "3" style="text-align: center;"><b>Cut-Off Information</b>   </td> 
       	 <td>
       	  <?php if ($cutoffs) { ?> <?php foreach ($cutoffs as $cutoff) { ?>
            <tr>
              <td class="left"><?php echo $cutoff['lttorig']; ?> </td>
              <td class="left"><?php echo $cutoff['lttcut']; ?></td>
              <td class="left"><?php echo $cutoff['ltttim']; ?></td>
              <td class="left"><?php echo $cutoff['lttoday']; ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="10"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
       	 </td>
       	 
       	 </tr>
       </table>
    
    </div><!---booking-type --->      
	    
      </form>
  	</div>
  </div>
</div>
<script type="text/javascript">$('#tabs a').tabs();</script> 
<script type="text/javascript">window.onload(function() {location.reload();});</script>
<?php echo $footer; ?>