<?php if ($_settings->chk_flashdata('success')): ?>
    <script>
        alert_toast("<?php echo $_settings->flashdata('success') ?>", 'success')
    </script>
<?php endif; ?>
<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">Khách hàng</h3>
        <!-- <div class="card-tools">
            <a href="?page=product/manage_product" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>
                Tạo</a>
        </div> -->
    </div>
    <div class="card-body">
        <div class="container-fluid">
            <div class="container-fluid">
                <table class="table table-bordered table-stripped">
                    <colgroup>
                        <col width="5%">
                        <col width="15%">
                        <col width="25%">
                        <col width="30%">
                        <col width="10%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Ngày tạo</th>
                            <th>Email</th>
                            <th>Họ</th>
                            <th>Tên</th>
                            <th>Trạng thái</th>
                            <th>Tùy chọn</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $i = 1;
                        $qry = $conn->query("SELECT * from `clients` order by unix_timestamp(date_created) desc ");
                        while ($row = $qry->fetch_assoc()):
                            foreach ($row as $k => $v) {
                                $row[$k] = trim(stripslashes($v));
                            }
                            //  $row['description'] = strip_tags(stripslashes(html_entity_decode($row['description'])));
                            ?>
                            <tr>
                                <td class="text-center">
                                    <?php echo $i++; ?>
                                </td>
                                <td>
                                    <?php echo date("Y-m-d H:i", strtotime($row['date_created'])) ?>
                                </td>
                                <td>
                                    <?php echo $row['email'] ?>
                                </td>
                                <td>
                                    <p class="m-0">
                                        <?php echo $row['firstname'] ?>
                                    </p>
                                </td>
                                <td>
                                    <p class="m-0">
                                        <?php echo $row['lastname'] ?>
                                    </p>
                                </td>
                                <td class="text-center">
                                    <?php if ($row['status'] == 1): ?>
                                        <span class="badge badge-success">Hoạt động</span>
                                    <?php else: ?>
                                        <span class="badge badge-danger">Bị chặn</span>
                                    <?php endif; ?>
                                </td>
                                <td align="center">
                                    <button type="button"
                                        class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon"
                                        data-toggle="dropdown">
                                        Tùy chọn
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <div class="dropdown-menu" role="menu">
                                        <a class="dropdown-item" href="?page=log&email=<?php echo $row["email"] ?>"><span
                                                class="fa fa-list-ul text-primary"></span> Log</a>
                                        <div class="dropdown-divider"></div>
                                        <?php if ($row['status'] == 1): ?>
                                            <a class="dropdown-item delete_data" href="javascript:void(0)"
                                                data-id="<?php echo $row['id'] ?>">
                                                <span class="fas fa-user-lock text-danger"></span>
                                                Chặn</a>
                                            <!-- <i class="fas fa-user-plus"></i> -->

                                            <!-- <i class=""></i> -->
                                            <!-- <i class="fa-solid fa-user-lock"></i> -->
                                        <?php else: ?>
                                            <a class="dropdown-item delete_data" href="javascript:void(0)"
                                                data-id="<?php echo $row['id'] ?>">
                                                <span class="fas fa-user-plus text-success"></span>
                                                Unlock</a>
                                            <!-- <i class="fas fa-user-plus"></i> -->
                                        <?php endif; ?>

                                    </div>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.delete_data').click(function () {
            _conf("Bạn có chắc chắn block/active user không?", "delete_product", [$(this).attr('data-id')]);
        })
        $('table').dataTable({
            language: {
                lengthMenu: "Hiển thị _MENU_ dòng mỗi trang",
                search: "Tìm kiếm:",
                info: "Hiển thị _START_ đến _END_ của _TOTAL_ dòng",
            }
        });
    })

    function delete_product($id) {
        start_loader();
        $.ajax({
            url: _base_url_ + "classes/Master.php?f=ban_or_active_user",
            method: "POST",
            data: {
                id: $id
            },
            dataType: "json",
            error: err => {
                console.log(err)
                alert_toast("An error occured.", 'error');
                end_loader();
            },
            success: function (resp) {
                console.log(resp);
                if (typeof resp == 'object' && resp.status == 'success') {
                    // alert_toast("An error occured.", 'error');
                    location.reload();
                } else {
                    alert_toast("An error occured.", 'error');
                    end_loader();
                }
            }
        })
    }
</script>