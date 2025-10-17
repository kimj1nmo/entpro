document.addEventListener("DOMContentLoaded", () => {
    const quantityInput = document.getElementById("cartQuantity");
    const paymentQuantityInput = document.getElementById("paymentQuantity");
    const cartHiddenQuantity = document.getElementById("cartHiddenQuantity");

    // 수량 입력 필드 변경 이벤트 리스너
    quantityInput.addEventListener("input", () => {
        const value = quantityInput.value;

        // 변경된 값을 숨겨진 필드에 동기화
        paymentQuantityInput.value = value;
        cartHiddenQuantity.value = value;
    });

    // 초기화 시 기본 값을 동기화
    const initialValue = quantityInput.value;
    paymentQuantityInput.value = initialValue;
    cartHiddenQuantity.value = initialValue;
});

// 리뷰 추가 함수
function addReview() {
    console.log("📌 [디버깅] 리뷰 작성 버튼이 클릭되었습니다."); // ✅ 버튼 클릭 확인

    const reviewContentElement = document.getElementById("reviewContent");
    const reviewImageElement = document.getElementById("reviewImage");
    const gdsNoElement = document.getElementById("gdsNo");

    if (!reviewContentElement || !gdsNoElement) {
        console.error("❌ [오류] 필수 요소가 없습니다. (reviewContent, gdsNo 확인 필요)");
        alert("리뷰 내용을 입력하세요.");
        return;
    }

    console.log("📌 [디버깅] 요소 값 확인:");
    console.log("✔ 상품 번호 (gdsNo):", gdsNoElement.value);
    console.log("✔ 리뷰 내용:", reviewContentElement.value);

    const reviewContent = reviewContentElement.value.trim();
    const gdsNo = gdsNoElement.value;

    if (reviewContent === "") {
        console.warn("⚠️ [경고] 리뷰 내용이 비어 있습니다.");
        alert("리뷰 내용을 입력하세요.");
        return;
    }

    // ✅ FormData 객체 생성
    let formData = new FormData();
    formData.append("gdsNo", gdsNo);
    formData.append("reContent", reviewContent);

    // ✅ 선택된 이미지 파일 추가 (최대 3장)
    if (reviewImageElement.files.length > 0) {
        console.log("📌 [디버깅] 업로드할 이미지 개수:", reviewImageElement.files.length);
        for (let i = 0; i < reviewImageElement.files.length; i++) {
            formData.append("reviewImages", reviewImageElement.files[i]);
            console.log(`✔ [파일 ${i + 1}]`, reviewImageElement.files[i].name);
        }
    } else {
        console.log("📌 [디버깅] 업로드된 이미지 없음.");
    }

    console.log("📌 [디버깅] 서버에 전송할 데이터 확인:", formData);

    // ✅ AJAX 요청 (FormData 전송)
    fetch("/shop/review/add", {
        method: "POST",
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        console.log("📌 [서버 응답 데이터]:", data); // ✅ 서버 응답 확인

        if (data === "success") {
            alert("리뷰가 등록되었습니다.");
            location.reload(); // 새로고침하여 리뷰 반영
        } else {
            alert("리뷰 등록에 실패했습니다.");
        }
    })
    .catch(error => {
        console.error("❌ [오류] AJAX 요청 중 문제 발생:", error);
        alert("리뷰 등록 중 오류가 발생했습니다.");
    });
}

document.addEventListener("DOMContentLoaded", function() {
    // 삭제 버튼 클릭 이벤트
    document.querySelectorAll(".delete-review-btn").forEach(button => {
        button.addEventListener("click", function() {
            const reNo = this.getAttribute("data-reNo");

            if (!confirm("정말 이 리뷰를 삭제하시겠습니까?")) {
                return;
            }

            fetch("/shop/review/delete", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: "reNo=" + encodeURIComponent(reNo)
            })
            .then(response => response.text())
            .then(result => {
                if (result.trim() === "success") {
                    alert("리뷰가 삭제되었습니다.");
                    location.reload();
                } else {
                    alert("리뷰 삭제에 실패했습니다: " + result);
                }
            })
            .catch(error => {
                console.error("리뷰 삭제 오류:", error);
                alert("삭제 중 오류가 발생했습니다.");
            });
        });
    });
});

document.addEventListener("DOMContentLoaded", function() {

    // ✅ 리뷰 수정 버튼 클릭 이벤트 (입력 필드 활성화)
    document.querySelectorAll(".update-review-btn").forEach(button => {
        button.addEventListener("click", function() {
            const reNo = this.getAttribute("data-reNo");
            const reviewItem = document.getElementById(`review-${reNo}`);

            // 기존 내용 숨기고, 수정 가능한 입력창 보여주기
            reviewItem.querySelector(".review-content-view").classList.add("d-none");
            reviewItem.querySelector(".review-edit-form").classList.remove("d-none");
        });
    });

    // ✅ 리뷰 수정 취소 버튼
    document.querySelectorAll(".cancel-review-btn").forEach(button => {
        button.addEventListener("click", function() {
            const reviewItem = this.closest(".review-item");

            // 기존 내용 보이도록 복귀
            reviewItem.querySelector(".review-content-view").classList.remove("d-none");
            reviewItem.querySelector(".review-edit-form").classList.add("d-none");
        });
    });

    // ✅ 리뷰 저장 버튼 클릭 이벤트 (AJAX 요청)
    document.querySelectorAll(".save-review-btn").forEach(button => {
        button.addEventListener("click", function() {
            const reNo = this.getAttribute("data-reNo");
            const reviewItem = document.getElementById(`review-${reNo}`);
            const updatedContent = reviewItem.querySelector(".review-edit-textarea").value.trim();
            const reviewImageElement = document.getElementById(`reviewImage-${reNo}`);

            if (updatedContent === "") {
                alert("리뷰 내용을 입력해주세요.");
                return;
            }

            let formData = new FormData();
            formData.append("reNo", reNo);
            formData.append("reContent", updatedContent);

            // ✅ 선택된 이미지 파일 추가 (최대 3장)
            if (reviewImageElement.files.length > 0) {
                for (let i = 0; i < reviewImageElement.files.length; i++) {
                    formData.append("reviewImages", reviewImageElement.files[i]);
                }
            }

            fetch("/shop/review/update", {
                method: "POST",
                body: formData
            })
            .then(response => response.text())
            .then(result => {
                if (result.trim() === "success") {
                    alert("리뷰가 수정되었습니다.");
                    location.reload(); // ✅ 새로고침하여 반영
                } else {
                    alert("리뷰 수정에 실패했습니다: " + result);
                }
            })
            .catch(error => {
                console.error("리뷰 수정 오류:", error);
                alert("수정 중 오류가 발생했습니다.");
            });
        });
    });

});
