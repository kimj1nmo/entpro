document.addEventListener("DOMContentLoaded", () => {
    const portfolioContainer = document.querySelector("#portfolio-items"); // 상품 목록 컨테이너
    const filters = document.querySelectorAll("#portfolio-filters .nav-link"); // 카테고리 필터 버튼
    const itemsPerPage = 8; // 한 페이지당 표시할 상품 개수
    let currentPage = 1;
    let activeFilter = "*"; // 현재 활성화된 필터
    let filteredItems = []; // 필터링된 상품 목록

    // 페이지네이션 요소 동적 생성
    const paginationContainer = document.createElement("div");
    paginationContainer.classList.add("pagination-container", "d-flex", "justify-content-center", "align-items-center", "mt-4");
    portfolioContainer.after(paginationContainer);

    // ✅ 필터 및 페이지 아이템 업데이트 함수 (전체 보기 포함)
    function updateFilteredItems() {
        const allItems = Array.from(portfolioContainer.querySelectorAll(".portfolio-item"));

        // ✅ 전체 보기인 경우 모든 상품 포함
        if (activeFilter === "*") {
            filteredItems = allItems;
        } else {
            filteredItems = allItems.filter(item => item.classList.contains(activeFilter.substring(1)));
        }

        console.log("현재 필터:", activeFilter, "필터링된 아이템 수:", filteredItems.length);

        // ✅ 페이지 초기화 및 표시
        currentPage = 1;
        generatePaginationButtons();
        showPage(currentPage);
    }

    // ✅ 페이지네이션 동적 버튼 생성
    function generatePaginationButtons() {
        paginationContainer.innerHTML = ""; // 기존 버튼 제거
        const totalPages = Math.ceil(filteredItems.length / itemsPerPage);
        if (totalPages <= 1) return; // 한 페이지면 페이지네이션 생략

        for (let i = 1; i <= totalPages; i++) {
            const pageBtn = document.createElement("button");
            pageBtn.classList.add("btn", "btn-sm", "mx-1", "page-btn");
            pageBtn.textContent = i;

            if (i === currentPage) {
                pageBtn.classList.add("btn-primary");
            } else {
                pageBtn.classList.add("btn-secondary");
            }

            pageBtn.addEventListener("click", () => {
                currentPage = i;
                showPage(currentPage);
            });

            paginationContainer.appendChild(pageBtn);
        }
    }

    // ✅ 페이지 아이템 표시 함수
    function showPage(page) {
        const startIdx = (page - 1) * itemsPerPage;
        const endIdx = page * itemsPerPage;

        // ✅ 전체 보기면 모든 아이템 표시
        document.querySelectorAll(".portfolio-item").forEach(item => {
            item.style.display = "none"; // 초기 숨김
        });

        filteredItems.forEach((item, index) => {
            if (index >= startIdx && index < endIdx) {
                item.style.display = "block";
            }
        });

        document.querySelectorAll(".page-btn").forEach((btn, index) => {
            btn.classList.toggle("btn-primary", index + 1 === page);
            btn.classList.toggle("btn-secondary", index + 1 !== page);
        });
    }

    // ✅ 필터 버튼 클릭 이벤트 (카테고리 선택)
    filters.forEach(filter => {
        filter.addEventListener("click", function () {
            filters.forEach(f => f.classList.remove("active"));
            this.classList.add("active");

            activeFilter = this.getAttribute("data-filter");
            updateFilteredItems();
        });
    });

    // ✅ 초기 필터 및 페이지네이션 로드
    updateFilteredItems();
});

// ✅ Swiper 초기화
document.addEventListener("DOMContentLoaded", () => {
    new Swiper('.swiper-container', {
        loop: true,
        autoplay: { delay: 5000 },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        slidesPerView: 1,
        spaceBetween: 10,
    });
});
