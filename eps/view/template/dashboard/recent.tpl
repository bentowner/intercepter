<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-flag"></i><?php echo $heading_title; ?> </h3>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
        <tr>
          <td class="text-center"><?php echo $column_booking_id; ?></td>
          <td class="text-left"><?php echo $column_customer; ?></td>
          <td class="text-right"><?php echo $column_service_from; ?></td>
          <td class="text-left"><?php echo $column_service_to; ?></td>
          <td class="text-center"><?php echo $column_bookedby; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php if ($bookings) { ?>
        <?php foreach ($bookings as $booking) { ?>
        <tr>
          <td class="text-center"> <?php foreach ($booking['action'] as $action) { ?>
                  <a  data-toggle="tooltip" title="<?php echo $button_view; ?>" href="<?php echo $action['href']; ?>"><?php echo $booking['booking_no']; ?> </a>
                  <?php } ?></td>
          <td><?php echo $booking['customer']; ?></td>
          <td class="text-right"><?php echo $booking['service_from']; ?></td>
          <td><?php echo $booking['service_to']; ?></td>
          <td class="text-center"><?php echo $booking['bookedby']; ?></td>
       
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
</div>
