const fs = require('fs');
const cp = require('child_process');

let part1 = fs.readFileSync('part1.txt', 'utf8');

const extraCss = `
            .container-haha {
                border-radius: 12px;
                padding: 38px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
            }

            .box {
                box-shadow: 0 4px 20px rgba(0,0,0,0.04);
                border-radius: 16px;
                border: 1px solid rgba(181, 147, 73, 0.15);
                padding: 24px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                text-align: center;
                margin: 0;
                background: #fff;
                transition: transform 0.3s cubic-bezier(0.165, 0.84, 0.44, 1), box-shadow 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
            }

            .box:hover {
                transform: translateY(-8px);
                box-shadow: 0 12px 30px rgba(181, 147, 73, 0.15);
                border-color: rgba(181, 147, 73, 0.3);
            }

            .box .banner-image {
                border-radius: 12px;
                margin-bottom: 20px;
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
            }

            .button-wrapper {
                margin-top: auto !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/includes/customer/navbar.jsp" />
`;

const middleHtml = `
        <div class="vehicle-filter-shell" style="margin-top: 130px; margin-bottom: 40px; position: relative; z-index: 99; overflow: visible !important;">
            <!-- thanh search -->
            <section style="overflow: visible !important;">
                <div class="filter-module">
                    <div class="filter-heading">
                        <div>
                            <span class="filter-eyebrow">Tìm kiếm nhanh</span>
                            <h2>Tìm chiếc xe phù hợp với bạn</h2>
                        </div>
                        <p>Tìm theo tên xe hoặc kết hợp nhiều tiêu chí để thu hẹp kết quả chính xác hơn.</p>
                    </div>

                    <!-- HÀNG 1: Ô Tìm Kiếm Từ Khóa -->
                    <div class="filter-search-row">
                        <form action="searchMotorcycle" method="get" class="filter-search-form">
                            <div class="filter-search-field">
                                <input id="textSearch" value="\${key}" name="textSearch" type="search" placeholder="Nhập tên hoặc dòng xe, ví dụ: Vision, Air Blade..." aria-label="Tìm kiếm xe máy">
                                <i class="bi bi-search search-icon"></i>
                            </div>
                            <button class="filter-search-submit" type="submit">
                                <i class="bi bi-search"></i>
                                <span>Tìm kiếm</span>
                            </button>
                        </form>
                    </div>

                    <!-- HÀNG 2: Các Dropdown Lọc Kết Quả -->
                    <div class="filter-toolbar">
                        <div class="filter-group">
                                <button type="button" class="filter-button price" data-label="Giá thuê" onclick="toggleOptions('priceOptions')">
                                    <span class="filter-button-icon"><i class="bi bi-cash-stack"></i></span>
                                    <span class="filter-button-copy">
                                        <span class="filter-label">Giá thuê</span>
                                        <span class="filter-status">Tất cả mức giá</span>
                                    </span>
                                </button>
                                <div class="filter-options" id="priceOptions">
                                    <c:forEach items="\${listPriceRange}" var="o">
                                        <input hidden name="priceRanges" value="\${o.minPrice},\${o.maxPrice}"/>
                                        <button type="button" data-id="\${o.minPrice},\${o.maxPrice}" class="button-item-option" onclick="toggleSelection(this)">
                                            <c:if test="\${o.minPrice == 0}">
                                                Dưới <fmt:formatNumber value="\${o.maxPrice}" type="number" maxFractionDigits="0"/>₫/ngày
                                            </c:if>
                                            <c:if test="\${o.minPrice != 0 && o.maxPrice != 0}">
                                                <fmt:formatNumber value="\${o.minPrice}" type="number" maxFractionDigits="0"/> - <fmt:formatNumber value="\${o.maxPrice}" type="number" maxFractionDigits="0"/>₫/ngày
                                            </c:if>

                                            <c:if test="\${o.maxPrice == 0}">
                                                Từ <fmt:formatNumber value="\${o.minPrice}" type="number" maxFractionDigits="0"/>₫/ngày
                                            </c:if>
                                        </button>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="filter-group">
                                <button type="button" class="filter-button" data-label="Hãng xe" onclick="toggleOptions('brandOptions')">
                                    <span class="filter-button-icon"><i class="bi bi-award"></i></span>
                                    <span class="filter-button-copy">
                                        <span class="filter-label">Hãng xe</span>
                                        <span class="filter-status">Tất cả hãng</span>
                                    </span>
                                </button>
                                <div class="filter-options" id="brandOptions">
                                    <c:forEach items="\${listBrand}" var="o">
                                        <input hidden name="brands" value="\${o.brandID}" id="searchBrand">
                                        <button type="button" class="button-item-option" data-id="\${o.brandID}"
                                                 onclick="toggleSelection(this)">\${o.brandName}</button>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="filter-group">
                                <button type="button" class="filter-button" data-label="Loại xe" onclick="toggleOptions('categoryOptions')">
                                    <span class="filter-button-icon"><i class="bi bi-grid"></i></span>
                                    <span class="filter-button-copy">
                                        <span class="filter-label">Loại xe</span>
                                        <span class="filter-status">Tất cả loại xe</span>
                                    </span>
                                </button>
                                <div class="filter-options" id="categoryOptions">
                                    <c:forEach items="\${categories}" var="o">
                                        <input hidden name="categories" value="\${o.categoryID}" id="searchCategory">
                                        <button type="button" class="button-item-option" data-id="\${o.categoryID}"
                                                 onclick="toggleSelection(this)">\${o.categoryName}</button>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="filter-group">
                                <button type="button" class="filter-button" data-label="Phân khối" onclick="toggleOptions('massOptions')">
                                    <span class="filter-button-icon"><i class="bi bi-speedometer2"></i></span>
                                    <span class="filter-button-copy">
                                        <span class="filter-label">Phân khối</span>
                                        <span class="filter-status">Tất cả dung tích</span>
                                    </span>
                                </button>
                                <div class="filter-options" id="massOptions">
                                    <c:forEach items="\${listDisplacement}" var="o">
                                        <input hidden name="displacements" value="\${o}" id="searchDisplacement">
                                        <button type="button" class="button-item-option" data-id="\${o}"
                                                 onclick="toggleSelection(this)">\${o}</button>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="filter-group">
                                <button type="button" class="filter-button" data-label="Nhu cầu" onclick="toggleOptions('needOptions')">
                                    <span class="filter-button-icon"><i class="bi bi-signpost-split"></i></span>
                                    <span class="filter-button-copy">
                                        <span class="filter-label">Nhu cầu</span>
                                        <span class="filter-status">Mọi mục đích</span>
                                    </span>
                                </button>
                                <div class="filter-options" id="needOptions">
                                    <c:forEach items="\${listDemand}" var="o">
                                        <input hidden name="demands" value="\${o.demandId}" id="searchDemand">
                                        <button type="button" class="button-item-option" data-id="\${o.demandId}" onclick="toggleSelection(this)">\${o.demand}</button>
                                    </c:forEach>
                                </div>
                            </div>

                        <button type="button" class="filter-apply-button" onclick="showResults()">
                            <i class="bi bi-sliders2"></i>
                            <span>Áp dụng bộ lọc</span>
                        </button>
                    </div>

                    <div class="selected-filters" id="selectedFilters">
                        <!-- Selected filters will be displayed here -->
                    </div>
                </div>
                <!-- SMART ASSISTANT BANNER -->
                <div class="container" style="margin-top: 40px; margin-bottom: 20px;">
                    <div style="background: linear-gradient(135deg, #1a1816 0%, #362f27 100%); border-radius: 24px; padding: 40px; color: white; box-shadow: 0 20px 40px rgba(0,0,0,0.15); position: relative; overflow: hidden;">
                        <!-- Decorative circle -->
                        <div style="position: absolute; top: -50px; right: -50px; width: 200px; height: 200px; background: radial-gradient(circle, rgba(181,147,73,0.3) 0%, rgba(255,255,255,0) 70%); border-radius: 50%;"></div>
                        
                        <div class="row align-items-center position-relative" style="z-index: 1;">
                            <div class="col-lg-6 mb-4 mb-lg-0">
                                <h3 style="font-family: 'Plus Jakarta Sans', sans-serif; font-weight: 800; font-size: 2rem; margin-bottom: 15px; color: #b59349;">
                                    <i class="bi bi-stars"></i> Trợ Lý SmartRide
                                </h3>
                                <p style="font-size: 1.1rem; color: #e0e0e0; margin-bottom: 0;">Bạn dự định khám phá những địa điểm tuyệt đẹp nào tại Đà Nẵng? Hệ thống sẽ gợi ý cho bạn chiếc xe hoàn hảo nhất!</p>
                            </div>
                            <div class="col-lg-6">
                                <form action="searchCriteria" method="get" onsubmit="return handleSmartSearch(event, this)">
                                    <div class="d-flex gap-2">
                                        <div class="flex-grow-1 position-relative">
                                            <i class="bi bi-geo-alt position-absolute" style="left: 15px; top: 50%; transform: translateY(-50%); color: #b59349; font-size: 1.2rem; pointer-events: none;"></i>
                                            <select name="locations" class="form-select form-select-lg" style="border-radius: 12px; border: none; background: #ffffff; color: #1a1816; font-weight: 500; font-family: 'Plus Jakarta Sans', sans-serif; box-shadow: 0 5px 15px rgba(0,0,0,0.1); cursor: pointer; padding-left: 45px; height: 56px;" required>
                                                <option value="" selected disabled>-- Chọn địa điểm du lịch --</option>
                                                <c:forEach items="\${listLocations}" var="loc">
                                                    <option value="\${loc.locationId}">\${loc.locationName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn" style="background: #b59349; color: white; border-radius: 12px; font-weight: 700; padding: 0 30px; height: 56px; white-space: nowrap; font-family: 'Plus Jakarta Sans', sans-serif; box-shadow: 0 5px 15px rgba(181,147,73,0.4); transition: all 0.3s ease;" onmouseover="this.style.transform='translateY(-2px)';" onmouseout="this.style.transform='translateY(0)';">
                                            Gợi ý ngay <i class="bi bi-magic ms-1"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                function handleSmartSearch(e, form) {
                    e.preventDefault();
                    
                    const btn = form.querySelector('button');
                    btn.disabled = true;
                    btn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Đang xử lý...';
                    
                    setTimeout(() => {
                        form.submit();
                    }, 1000);
                }
                </script>

                <div class="list">
                    <div style="text-align: center; margin-top: 40px;">
                        <span class="list-subtitle animate__animated animate__fadeIn">Bộ Sưu Tập Xe</span>
                        <c:choose>
                            <c:when test="\${not empty param.locations and param.locations != 'all'}">
                                <c:set var="locName" value="" />
                                <c:forEach items="\${listLocations}" var="loc">
                                    <c:if test="\${loc.locationId == param.locations}">
                                        <c:set var="locName" value="\${loc.locationName}" />
                                    </c:if>
                                </c:forEach>
                                <c:if test="\${not empty locName}">
                                    <h1 class="animate__animated animate__backInDown">Gợi ý xe cho <span style="color: #b59349;">\${locName}</span></h1>
                                </c:if>
                                <c:if test="\${empty locName}">
                                    <h1 class="animate__animated animate__backInDown">Danh Sách Xe Máy</h1>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <h1 class="animate__animated animate__backInDown">Danh Sách Xe Máy</h1>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="container-haha animate__animated animate__zoomIn">
                        <div class="wrapper row" id="motorcycleContent">
                            <c:if test="\${not empty noResults}">
                                <div class="text-center no-results-message">
                                    Không có mẫu xe nào phù hợp với tìm kiếm của bạn.
                                </div>
                            </c:if>

                            <c:forEach var="motorbike" items="\${motorcycles}">
                                <div class="col-md-6 col-lg-4 mb-4">
                                    <div class="motorcycle box h-100">
                                        <div class="banner-image">
                                            <a href="motorcycleDetail?id=\${motorbike.motorcycleId}"><img src="images/\${motorbike.image}" style="width:100%; height:auto; object-fit:contain; max-height: 220px;" alt="\${motorbike.model}"/></a>
                                        </div>
                                        <h2 style="margin: 20px 0 8px 0; font-family: 'Plus Jakarta Sans', sans-serif; font-size: 1.4rem; color: #1a1816; font-weight: 800;"><a href="motorcycleDetail?id=\${motorbike.motorcycleId}" style="color: inherit; text-decoration: none;">\${motorbike.model}</a></h2>
                                        <div style="font-family: 'Plus Jakarta Sans', sans-serif; font-weight: 600; font-size: 0.85rem; color: #6c757d; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px;">\${categoryMap[motorbike.categoryID]}</div>
                                        <div style="margin-bottom: 16px;">
                                            <c:choose>
                                                <c:when test="\${not empty activeEvent and activeEvent.discount > 0}">
                                                    <div style="display: flex; gap: 8px; justify-content: center; align-items: center; margin-bottom: 5px;">
                                                        <span style="font-size: 14px; color: #999; text-decoration: line-through;">
                                                            <fmt:formatNumber value="\${priceMap[motorbike.priceListID]}" type="number" maxFractionDigits="0"/>₫
                                                        </span>
                                                        <span style="color: #dc2626; font-size: 12px; font-weight: bold; background: #fee2e2; padding: 2px 6px; border-radius: 4px;">
                                                            -<fmt:formatNumber value="\${activeEvent.discount * 100}" maxFractionDigits="0"/>%
                                                        </span>
                                                    </div>
                                                    <div style="font-size: 1.2rem; color: #b59349; font-weight: 700; font-family: 'Plus Jakarta Sans', sans-serif;">
                                                        <fmt:formatNumber value="\${priceMap[motorbike.priceListID] * (1 - activeEvent.discount)}" type="number" maxFractionDigits="0"/>₫<span style="font-size: 0.9rem; color: #6c757d; font-weight: 500;">/ngày</span>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div style="font-size: 1.2rem; color: #b59349; font-weight: 700; font-family: 'Plus Jakarta Sans', sans-serif;">
                                                        <fmt:formatNumber value="\${priceMap[motorbike.priceListID]}" type="number" maxFractionDigits="0"/>₫<span style="font-size: 0.9rem; color: #6c757d; font-weight: 500;">/ngày</span>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="button-wrapper" style="display: flex; gap: 10px; justify-content: center; width: 100%; margin-top: auto; padding-top: 10px;">
                                            <a href="motorcycleDetail?id=\${motorbike.motorcycleId}" class="btn outline-huhu" style="flex: 1; text-align: center; display: inline-flex; align-items: center; justify-content: center;">CHI TIẾT</a>
                                            <c:choose>
                                                <c:when test="\${not empty listMA[motorbike.motorcycleId]}">
                                                    <a href="booking?motorcycleid=\${motorbike.motorcycleId}" class="btn fill" style="flex: 1; text-align: center; display: inline-flex; align-items: center; justify-content: center;">THUÊ NGAY</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="#" class="btn fill disabled" style="flex: 1; text-align: center; display: inline-flex; align-items: center; justify-content: center;">HẾT XE</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
`;

let gitContent = cp.execSync('git show HEAD:src/main/webapp/motorbikes.jsp', { encoding: 'utf8' });
const searchString = '<div class="row mt-5">';
const bottomIndex = gitContent.indexOf(searchString);

const bottomHtml = gitContent.substring(bottomIndex);

const fullHtml = part1 + extraCss + middleHtml + bottomHtml;

fs.writeFileSync('src/main/webapp/motorbikes.jsp', fullHtml, 'utf8');
fs.writeFileSync('d:/A_JAVA_Ki_5/SWP391/motor-booking/motorcycle-booking-system-main/target/MotorcyleHiringProject-1.0-SNAPSHOT/motorbikes.jsp', fullHtml, 'utf8');

console.log("Successfully rebuilt motorbikes.jsp using pure git show utf8!");
