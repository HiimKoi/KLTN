<style>
    table td,
    table th {
        padding: 3px !important;
    }
</style>
<?php
$date_start = isset($_GET['date_start']) ? $_GET['date_start'] : date("Y-m-d", strtotime(date("Y-m-d") . " -7 days"));
$date_end = isset($_GET['date_end']) ? $_GET['date_end'] : date("Y-m-d");
$email = isset($_GET['email']) ? $_GET['email'] : "";

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $email = "";
}

?>
<div class="card card-primary card-outline">
    <div class="card-header">
        <h5 class="card-title">Thống kê log user</h5>
    </div>
    <div class="card-body">
        <!-- <hr> -->
        <div id="printable">
            <div>
                <h4 class="text-center m-0">
                    <?php echo $_settings->info('name') ?>
                </h4>
                <h3 class="text-center m-0"><b>Lịch sử đăng nhập của khách hàng</b></h3>
                <hr>
                <!-- <p class="text-center m-0">Thời gian
                    <?php echo $date_start ?> đến
                    <?php echo $date_end ?>
                </p> -->
                <!-- <hr> -->
                <form id="filter-form">
                    <div class="row align-items-end">
                        <div class="form-group col-md-3">
                            <label for="date_start">Từ</label>
                            <input type="date" class="form-control form-control-sm" name="date_start"
                                value="<?php echo date("Y-m-d", strtotime($date_start)) ?>">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="date_start">Đến</label>
                            <input type="date" class="form-control form-control-sm" name="date_end"
                                value="<?php echo date("Y-m-d", strtotime($date_end)) ?>">
                        </div>
                        <hr>
                        <div class="form-group col-md-1">
                            <button class="btn btn-flat btn-block btn-primary btn-sm"><i class="fa fa-filter"></i>
                                Lọc</button>
                        </div>
                        <div class="form-group col-md-1">
                            <button class="btn btn-flat btn-block btn-success btn-sm" type="button" id="printBTN"><i
                                    class="fa fa-print"></i> In</button>
                        </div>
                    </div>
                </form>
            </div>
            <table class="table table-bordered">
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="15%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="35%">
                </colgroup>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Ngày</th>
                        <th>Email</th>
                        <th>IP</th>
                        <th>Status</th>
                        <th>Message</th>
                        <th>User Agent</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $i = 1;
                    // $qry = $conn->query("SELECT * FROM `client_login` where date(date_created) between '{$date_start}' and '{$date_end}' order by unix_timestamp(date_created) desc ");
                    // echo "SELECT * FROM `client_login` where date(date_login) between '{$date_start}' and '{$date_end}' order by unix_timestamp(date_login) desc ";
                    // echo "<br>";
                    $query_command = "SELECT * FROM `client_login` where (date(date_login) between '{$date_start}' and '{$date_end}') and email != '' order by unix_timestamp(date_login) DESC";
                    if (isset($email) && $email != "") {
                        $query_command = "SELECT * FROM `client_login` where (date(date_login) between '{$date_start}' and '{$date_end}') and email = '$email' order by unix_timestamp(date_login) DESC";
                    }

                    $qry = $conn->query($query_command);
                    while ($row = $qry->fetch_assoc()):
                        // $olist = $conn->query("SELECT ol.*,p.title,p.author,concat(c.firstname,' ',c.lastname) as name,c.email,o.date_created FROM order_list ol inner join orders o on o.id = ol.order_id inner join `products` p on p.id = ol.product_id inner join clients c on c.id = o.client_id  where ol.order_id = '{$row['order_id']}' ");
                        // while ($roww = $olist->fetch_assoc()):
                        ?>
                        <tr>
                            <td class="text-center">
                                <?php echo $i++ ?>
                            </td>
                            <td>
                                <?php echo $row['date_login'] ?>
                            </td>
                            <td>
                                <p class="m-0">
                                    <?php echo $row['email'] ?>
                                </p>
                            </td>
                            <td>
                                <p class="m-0">
                                    <?php echo $row['ip'] ?>
                                </p>
                            </td>
                            <td>
                                <p class="m-0">
                                    <?php if ($row['status']) {
                                        echo "Success";
                                    } else {
                                        echo "Error";
                                    } ?>
                                </p>
                            </td>
                            <td>
                                <p class="m-0">
                                    <?php echo $row['error'] ?>
                                </p>
                            </td>
                            <td>
                                <p class="m-0">
                                    <?php echo $row['user_agent'] ?>
                                </p>
                            </td>
                            <!-- <td class="text-center">
                            <?php echo $row['quantity'] ?>
                        </td>
                        <td class="text-right">
                            <?php echo number_format($row['quantity'] * $row['price']) ?>
                        </td> -->
                        </tr>
                    <?php endwhile; ?>
                    <!-- <?php ; ?> -->
                    <?php if ($qry->num_rows <= 0): ?>
                        <tr>
                            <td class="text-center" colspan="6">No Data...</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<noscript>
    <style>
        .m-0 {
            margin: 0;
        }

        .text-center {
            text-align: center;
        }

        .text-right {
            text-align: right;
        }

        .table {
            border-collapse: collapse;
            width: 100%
        }

        .table tr,
        .table td,
        .table th {
            border: 1px solid gray;
        }
    </style>
</noscript>
<script>
    $(function () {
        $('#filter-form').submit(function (e) {
            e.preventDefault()
            location.href = "./?page=log&date_start=" + $('[name="date_start"]').val() + "&date_end=" +
                $(
                    '[name="date_end"]').val()
        })

        $('#printBTN').click(function () {
            var rep = $('#printable').clone();
            var ns = $('noscript').clone().html();
            start_loader()
            rep.prepend(ns)
            var nw = window.document.open('', '_blank', 'width=900,height=600')
            nw.document.write(rep.html())
            nw.document.close()
            nw.print()
            setTimeout(function () {
                nw.close()
                end_loader()
            }, 500)
        })

        $('table').dataTable({
            language: {
                lengthMenu: "Hiển thị _MENU_ dòng mỗi trang",
                search: "Tìm kiếm:",
                info: "Hiển thị _START_ đến _END_ của _TOTAL_ dòng",
                paginate: {
                        "previous": "Trước",
                        "next": "Sau"}
            }
        });
    })
</script>