<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<!-- 모든 페이지에 이거 추가해야함 -->
<div class="content-wrapper">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">managepage</a></li>
						<li class="breadcrumb-item active">FAQ</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!--  /.content-header -->
	<!-- Main content -->
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- ///// content 시작 ///// -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>

<section class="content">
	<div class="container-fluid">
		<!-- ///// content 시작 ///// -->
		<h3>sampleStatistics </h3>
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
<canvas id="myChart" width="300" height="100"></canvas>
<canvas id="myChart2" width="300" height="100"></canvas>

					</div>
				</div>
				<!-- /.card-header -->

				<div class="card-body table-responsive p-0" id="divDetailArea">

				</div>
				<!-- /.card-body -->
				<!-- card-footer 시작 -->
				<div class="card-footer" id="divPagingArea"></div>
				<!-- card-footer 끝 -->
			</div>
			<!-- /.card -->

		</div>
		<div class="col-12" style="justify-content: right; display: flex;">
			<a data-toggle="modal" data-target="#modalAdd"
				class="btn btn-primary">등록</a>
		</div>



		<!-- ///// content 끝 ///// -->
	</div>
	<!-- /.container-fluid -->
</section>




<!-- ///// content 끝 ///// -->
<script type="text/javascript">
let myCt = document.getElementById('myChart');

let myChart = new Chart(myCt, {
  type: 'bar',
  data: {
    labels: ['2020', '2021', '2022', '2023'],
    datasets: [
      {
        label: 'Dataset',
        data: [10,20,30,40],
      }
    ]
  },
});

let myCt2 = document.getElementById('myChart2');

let myChart2 = new Chart(myCt2, {
  type: 'bar',
  data: {
    labels: ['2020', '2021', '2022', '2023'],
    datasets: [
      {
        label: 'Dataset',
        data: [10,20,30,40],
      }
    ]
  },
});
</script>
<%@ include file="../include/footer.jsp"%>
