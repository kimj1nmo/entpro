<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../include/header.jsp" %>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/directlyCss/main.css">
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











<section class="content">
      <div class="container-fluid">
        <div class="card card-primary card-outline">
          <div class="card-header">
            <h3 class="card-title">서명 설정 ${memberVO }</h3>
          </div> <!-- /.card-body -->
          <div class="card-body">
          
          
          
          
						<div style="display: flex; gap: 20px;">
							<!-- 좌측: 현재 이미지 -->
							<div id="currentImage">
								<img id="imagePreview" src="/default/image.jpg" alt="이미지 미리보기" style="width: 200px; height: auto;"/>
							</div>
						
							<!-- 우측: 이미지 업로드 -->
							<div id="uploadImage">
								<input type="file" id="fileInput" accept="image/*" />
								<button id="uploadButton">업로드</button>
								<button id="resetButton">기본값으로</button>
							</div>
						</div>
						
          
          










          </div><!-- /.card-body -->
        </div>
      </div><!-- /.container-fluid -->
    </section>









		<script>


			// DOM 요소 가져오기
	const fileInput = document.getElementById("fileInput");
	const imagePreview = document.getElementById("imagePreview");
	const uploadButton = document.getElementById("uploadButton");
	
	// 파일 선택 시 미리보기 업데이트
	fileInput.addEventListener("change", (event) => {
		const file = event.target.files[0];
		if (file) {
			const reader = new FileReader();
			reader.onload = (e) => {
				imagePreview.src = e.target.result; // 선택한 이미지 미리보기
			};
			reader.readAsDataURL(file);
		}
	});
	
	// 파일 업로드 처리 (Axios)
	uploadButton.addEventListener("click", async () => {
		const file = fileInput.files[0];
		if (!file) {
			alert("파일을 선택하세요.");
			return;
		}
	
		const formData = new FormData();
		formData.append("image", file);
	
		try {
			const response = await axios.post("/upload/image", formData, {
				headers: {
					"Content-Type": "multipart/form-data",
				},
			});
	
			if (response.data.success) {
				alert("이미지가 성공적으로 업로드되었습니다!");
				// 업로드 후 현재 이미지 업데이트
				imagePreview.src = response.data.imageUrl; // 서버에서 새 이미지 경로 제공
			} else {
				alert("업로드에 실패했습니다. 다시 시도해주세요.");
			}
		} catch (error) {
			console.error("업로드 오류:", error);
			alert("업로드 중 오류가 발생했습니다.");
		}
	});
	
	</script>	























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

<%@ include file="../../include/footer.jsp" %>  