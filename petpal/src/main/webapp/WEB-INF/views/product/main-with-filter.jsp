<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <div class="body-container">    
        <div class="list-container list-h">
            <div class="left">
                <h2 class="title"></h2>
                <div class="side-box">
                    <h4>카테고리</h4>
                    <ul class="list-v category">
                        <li><a class="${parentCategory == 0 ? 'selected' : ''}" href="${pageContext.request.contextPath}/products/category/${species}/0">전체</a></li>
                        <c:forEach items="${categories}" var="category">
                        	<li><a class="${parentCategory == category.CATEGORYNUM ? 'selected' : ''}" href="${pageContext.request.contextPath}/products/category/${species}/${category.CATEGORYNUM}/0">${category.CATEGORYNAME}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="side-box">
                    <h4>가격</h4>
                    <ul class="list-w">
                    	<li>
	                    	<div class="price-input">
	                    		<input type="number" name="minPrice" value="${not empty param.minPrice ? param.minPrice : ''}"> ~ 
	                    		<input type="number" name="maxPrice" value="${not empty param.maxPrice ? param.maxPrice : ''}">&nbsp;
	                    		<button type="button" class="search-button">검색</button>
	                    	</div>
                    	</li>
                    </ul>
                </div>
                <div class="side-box">
                    <h4>평점</h4>
                    <ul class="list-v rating">
                    	<li>
                    		<input class="checkbox" type="checkbox" value="0" id="minRating-0" style="display: none;" ${empty param.minRating || param.minRating == 0 ? 'checked' : ''}>
                    		<label class="checkbox" for="minRating-0"></label>&nbsp;
	                		<label class="checkbox" for="minRating-0">전체</label>
                    	</li>
                    	<c:forEach begin="1" end="4" step="1" var="i">
                    		<li>
                    			<input class="checkbox" type="checkbox" value="${i}" id="minRating-${i}" style="display: none;" ${param.minRating == i ? 'checked' : ''}>
                    			<label class="checkbox" for="minRating-${i}"></label>&nbsp;
	                			<label class="checkbox" for="minRating-${i}">${i}점 이상</label>
                    		</li>
                    	</c:forEach>
                    </ul>
                </div>
                <c:forEach items="${attributes}" var="attribute">
                	<div class="side-box" data-attributeNum="${attribute.attributeNum}">
	                	<h4>${attribute.attributeName}</h4>
	                	<ul class="list-v">
	                		<c:forEach items="${attribute.attrDtls}" var="dtl">
	                			<li data-dtlNum="${dtl.attrDtlNum}" style="vertical-align: text-top;" class="checkbox">
	                				<input class="checkbox" type="checkbox" id="attr-${dtl.attrDtlNum}" name="${attribute.attributeNum}" style="display: none;" value="${dtl.attrDtlNum}" onchange="toggleAttr(${attribute.attributeNum}, ${dtl.attrDtlNum});">
	                				<label class="checkbox" for="attr-${dtl.attrDtlNum}"></label>&nbsp;
	                				<label class="checkbox" for="attr-${dtl.attrDtlNum}">${dtl.attrDtlName}</label>
	                			</li>
	                		</c:forEach>
	                	</ul>
                	</div>
                </c:forEach>
            </div>

            <div class="right">
                <div class="subcategory-box">
                    <ul class="list-h subcategory-list">
                        <li>
                        	<a
                        		${parentCategory == 0 || categoryNum == 0 ? 'class="selected"' : ''}
                        		href="${pageContext.request.contextPath}/products/category/${species}/${empty parentCategory ? '' : parentCategory += '/'}0"
                        	>
                        		전체
                        	</a>
                        </li>
                        <c:forEach items="${subCategories}" var="subCategory">
                        	<li>
                        		<c:if test="${empty subCategory.PARENTCATEGORY}">
                        			<a
                        				class="${parentCategory == subCategory.CATEGORYNUM ? 'selected' : ''}"
                        				href="${pageContext.request.contextPath}/products/category/${species}/${subCategory.CATEGORYNUM}">${subCategory.CATEGORYNAME}
                        			</a>
                        		</c:if>
                        		<c:if test="${not empty subCategory.PARENTCATEGORY}">
                        			<a 
	                        			class="${categoryNum == subCategory.CATEGORYNUM ? 'selected' : ''}"
	                        			href="${pageContext.request.contextPath}/products/category/${species}/${subCategory.PARENTCATEGORY}/${subCategory.CATEGORYNUM}">${subCategory.CATEGORYNAME}
	                        		</a>
                        		</c:if>
                        	</li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="sort-box list-h">
                    <span>전체 <strong>${dataCount}</strong>개</span>
                    <div class="dropdown">
                        <div class="list-h">
                            <button class="dropdown-button">
                                등록일
                            </button>
                            <i class="order bi fs-5 bi-arrow-${empty param.order || param.order == 'desc' ? 'down' : 'up'}" data-order="${empty param.order ? 'desc' : param.order}"></i>
                        </div>
                        <ul class="dropdown-menu-petpal menu-hidden">
                            <li class="menu-item" data-sortby="regDate">등록일</li>
                            <li class="menu-item" data-sortby="price">가격</li>
                            <li class="menu-item" data-sortby="sales">판매량</li>
                            <li class="menu-item" data-sortby="rating">평점</li>
                            <li class="menu-item" data-sortby="reviewCount">후기수</li>
                        </ul>
                    </div>
                </div>
                <div class="display-box list-h">
                	<c:forEach items="${products}" var="product">
	                    <div class="product-box" onclick="location.href='${pageContext.request.contextPath}/product/${species}/${product.productNum}';"> 
	                        <div class="product-img-box">
	                            <img src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}" alt="이미지">
	                        </div>
	                        <div class="product-info">
	                            <p>${product.brand}</p>
	                            <p>${product.productName}</p>
	                            <p>${product.price}</p>
	                            <p>${product.discountRate}/판매가</p>
	                            <p>평점</p>
	                        </div>
	                    </div>
                	</c:forEach>
                </div>
                <div class="page-box">
                    <span>1</span>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <a href="">5</a>
                    <a href="">6</a>
                    <a href="">7</a>
                    <a href="">8</a>
                    <a href="">9</a>
                    <a href="">10</a>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript">

window.addEventListener('load', function() {
	const sortCriteria = {price: '가격', sales: '판매량', regDate: '등록일', rating: '평점', reviewCount: '후기수'};
	document.querySelector('.title').innerText = document.querySelector('.category .selected').innerText;
	if ('${param.sortBy}') {
		document.querySelector('.dropdown-button').innerText = sortCriteria['${param.sortBy}'];
		document.querySelector('.menu-item[data-sortBy=${param.sortBy}]').remove();
	}

	document.addEventListener('click', function(e) {
		e.stopPropagation();
		
		const menu = document.querySelector('.dropdown-menu-petpal');
		if (e.target != document.querySelector('.dropdown-button')) {
			
			if (menu.classList.contains('menu-shown')) {
				menu.classList.toggle('menu-hidden');
		        menu.classList.toggle('menu-shown');
			}
		}
	});
	
});

const replaceParam = (url, param, value) => {
	url.searchParams.delete(param);
	if (value) {
		url.searchParams.append(param, value);
	}
}

window.addEventListener('load', function() {
	document.querySelector('button.search-button').addEventListener('click', function(e) {
		const $elPrice = e.currentTarget.closest('.price-input');
		const minPrice = $elPrice.querySelector('input[name=minPrice]').value;
		const maxPrice = $elPrice.querySelector('input[name=maxPrice]').value;
		
		const url = new URL(window.location.href);

		if (minPrice.trim()) {
			replaceParam(url, 'minPrice', minPrice);
		}
		if (maxPrice.trim()) {
			replaceParam(url, 'maxPrice', maxPrice);
		}
		
		location.href = url.toString();
	});
	
	document.querySelector('.rating').addEventListener('click', function(e) {
		const url = new URL(window.location.href);
		
		e.stopPropagation();
		const minRating = e.target.closest('li').querySelector('input.checkbox').value;

		replaceParam(url, 'minRating', minRating);
		
		location.href = url.toString();
	});
	
	
});

window.addEventListener('load', function() {
	const url = new URL(document.location.href);
	let params = url.searchParams;
	
	let values = params.get('attributes');
	
	if (values) {
		values = values.split(',');
		
		for (let value of values) {
			document.getElementById('attr-' + value).setAttribute('checked', 'checked');
		}
	}
});

function toggleAttr(attrNum, dtlNum) {
	const url = new URL(window.location.href);
	let values = url.searchParams.get('attributes');
	values = values ? values.split(',') : [];
	
	if (values.includes(dtlNum.toString())) {
		values = values.filter(e => e != dtlNum.toString());
	} else {
		values.push(dtlNum.toString());
	}
	
	replaceParam(url, 'attributes', values.toString());
	
	location.href = url.toString();
}

window.addEventListener('load', function() {
    document.querySelector('button.dropdown-button').addEventListener('click', function(e) {
    	const menu = e.target.closest('div.dropdown').querySelector('.dropdown-menu-petpal');

        menu.classList.toggle('menu-hidden');
        menu.classList.toggle('menu-shown');
    });
    
    const menuItems = document.querySelectorAll('.menu-item');
    
    for (let item of menuItems) {
    	item.addEventListener('click', function(e) {
    		const url = new URL(document.location.href);
    		
    		const sortBy = e.target.dataset.sortby;
    		const order = this.closest('.list-h').querySelector('i.order').dataset.order;

    		replaceParam(url, 'sortBy', sortBy);
    		replaceParam(url, 'order', order);
    		location.href = url.toString();
    	});
    }
    
    document.querySelector('i.order').addEventListener('click', function(e) {
    	let order = this.getAttribute('data-order') === 'desc' ? 'asc' : 'desc';
		const url = new URL(location.href);
		
		if (! url.searchParams.get('sortBy')) {
			url.searchParams.append('sortBy', 'regDate');
		}
		
    	replaceParam(url, 'order', order);
    	location.href = url.toString();
    });
});
</script>