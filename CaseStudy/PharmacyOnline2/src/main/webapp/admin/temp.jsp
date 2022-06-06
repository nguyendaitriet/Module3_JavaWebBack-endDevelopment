<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin Dashboard</title>
    <%@ include file="/layout/header.jsp" %>
</head>

<body>

<!-- Begin page -->
<div id="wrapper">


    <!-- Topbar Start -->
    <%@ include file="/layout/topbar.jsp" %>
    <!-- end Topbar --> <!-- ========== Left Sidebar Start ========== -->

    <div class="left-side-menu">

        <div class="slimscroll-menu">

            <!--- Sidemenu -->
            <div id="sidebar-menu">
                <%@ include file="/layout/sidebar-left.jsp" %>
            </div>
            <!-- End Sidebar -->

            <div class="clearfix"></div>

        </div>
        <!-- Sidebar -left -->

    </div>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Welcome !</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb p-0 m-0">
                                    <li class="breadcrumb-item"><a href="#">Velonic</a></li>
                                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Dashboard 1</li>
                                </ol>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-xl-3 col-sm-6">
                        <div class="card bg-pink">
                            <div class="card-body widget-style-2">
                                <div class="text-white media">
                                    <div class="media-body align-self-center">
                                        <h2 class="my-0 text-white"><span data-plugin="counterup">50</span></h2>
                                        <p class="mb-0">Daily Visits</p>
                                    </div>
                                    <i class="ion-md-eye"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-sm-6">
                        <div class="card bg-purple">
                            <div class="card-body widget-style-2">
                                <div class="text-white media">
                                    <div class="media-body align-self-center">
                                        <h2 class="my-0 text-white"><span data-plugin="counterup">12056</span></h2>
                                        <p class="mb-0">Sales</p>
                                    </div>
                                    <i class="ion-md-paper-plane"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-sm-6">
                        <div class="card bg-info">
                            <div class="card-body widget-style-2">
                                <div class="text-white media">
                                    <div class="media-body align-self-center">
                                        <h2 class="my-0 text-white"><span data-plugin="counterup">1268</span></h2>
                                        <p class="mb-0">New Orders</p>
                                    </div>
                                    <i class="ion-ios-pricetag"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-sm-6">
                        <div class="card bg-primary">
                            <div class="card-body widget-style-2">
                                <div class="text-white media">
                                    <div class="media-body align-self-center">
                                        <h2 class="my-0 text-white"><span data-plugin="counterup">145</span></h2>
                                        <p class="mb-0">New Users</p>
                                    </div>
                                    <i class="mdi mdi-comment-multiple"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End row -->
            </div>
            <!-- end container-fluid -->
        </div>
        <!-- end content -->

        <!-- Footer Start -->
        <%@ include file="/layout/footer.jsp" %>
        <!-- end Footer -->

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->

</div>
<!-- END wrapper -->


<!-- Right Sidebar -->
<%@ include file="/layout/sidebar-right.jsp" %>
<!-- /Right-bar -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<a href="javascript:void(0);" class="right-bar-toggle demos-show-btn">
    <i class="mdi mdi-settings-outline mdi-spin"></i> &nbsp;Choose Demos
</a>

<!-- Vendor js -->
<%@ include file="/layout/script.jsp" %>
</body>
</html>