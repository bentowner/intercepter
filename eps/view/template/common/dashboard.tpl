<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">

      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning_admin) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_admin; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success_admin) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success_admin; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $packagedsolution; ?></div>
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $customsolution; ?></div>
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $strategicinit; ?></div>
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $online; ?></div>
    </div>
    <div class="row">
     <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $workload; ?> </div>
     <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $chart; ?></div>
    </div>


    <div class="row">
      <div class="col-lg-4 col-md-12 col-sm-12 col-sx-12"><?php echo $activity; ?></div>
    </div>
  </div>
</div>


<?php echo $footer; ?>

  <!-- Modal -->
  <div class="modal fade" id="helpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header"  style="background: #9f0709;" >
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"  style="color:white;"><b><i>Help Items</b></i></h4>
        </div>
        <div class="modal-body">
          <div class="row header contact">
			<div class="col-lg-12" >
			<div class="table">
			<div class=".col-lg-12 col-md-12 col-sm-6" >

			 </div>
			<div class="row" >
			<table id="quick_keys" class="table table-bordered">
				<thead>
					<tr>
					<td colspan = '2'>Hot Key Reference Guide - <b>" Shift + H "</b></td>

					</tr>
				</thead>
				<tbody >

					<tr><td class="text-right">Clone the Last Quote</td><td>Control + Shift + 1</td></tr>
					<tr><td class="text-right">Clone the Last Booking</td><td>Control + Shift + 2</td></tr>
					<tr><td class="text-right">Use the Last Customer</td><td>Shift + 6</td></tr>

				</tbody>
			 </table>
			 </div>
			  <div  class=".col-lg-10 .col-lg-offset-2  .col-md-10 .col-md-offset-2  .col-sm-6" >
			 	<div class="text-muted"><span>Use "Hot Keys" to speed it up. Click <a href="<?php echo HTTP_HELP;?>HotKeys" target="_blank">here</a> for more information about how to use Hot Keys.</a></span> </div>
			 </div><!-- end row -->
			</div>

			 </div>
        </div>
        <div class="modal-footer">

          <button type="button" class="btn btn-default" data-dismiss="modal">Finished</button>

        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->


<script type="text/javascript"><!--
function manageHelp(){	  $('#helpModal').modal('show');	  	}
//--></script>

<script type="text/javascript">$(document).ready(function() {



		 shortcut.add("SHIFT+H",function() {

			manageHelp();
		
		});

	});

	//--></script>
