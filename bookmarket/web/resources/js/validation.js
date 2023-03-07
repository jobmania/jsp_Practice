

function CheckAddBook() {
    // const bookId = document.getElementById("bookId").value; // 도서 아이디
    const bookId = document.newBook.bookId.value;
    const name = document.newBook.name.value; // 도서명
    const unitPrice = document.newBook.unitPrice.value; // 가격
    const author = document.newBook.author.value; // 저자
    const publisher = document.newBook.author.value; // 출판사
    const unitsInStock = document.newBook.unitsInStock.value; // 재고 수
    const description = document.newBook.description.value;

    const regex = /^ISBN[0-9]{1,8}$/;

    if(check(regex,bookId)){
        console.log("정규식 통과!") // 정규식 검증에 문제
    }else {
        console.log("정규식 실패") //
        // 오류 시
        alert("[도서코드]\nISBN과 숫자를 조합하여 5~12자까지 입력하세요.\n첫글자는 반드시 ISBN으로 시작하세요."); // 에러 메시지 msg 출력
        document.newBook.bookId.select(); // 입력 항목 선택
        document.newBook.bookId.focus(); // 입력 항목 커서 맞춤
        return false;
    }

    function check(regExp, e) {
        return regExp.test(e);
    }


    if (name.length < 4 || name.length > 20) { // 도서명의 문자 길이가 4~20자인지 유효성 검사
        alert("도서명은 4~20자까지 입력 가능합니다.");

        document.newBook.name.select();
        document.newBook.name.focus();
        return false;
    }

    if (unitPrice.length == 0 || isNaN(unitPrice)) { // 가격의 문자 길이가 0인지 숫자인지 유효성 검사
        alert("가격은 숫자를 입력해야 합니다.");

        document.newBook.unitPrice.select();
        document.newBook.unitPrice.focus();
        return false;
    }

    if (author.length < 2 || author.length > 12) {
        alert("저자는 2~12자까지 입력 가능합니다.");

        document.newBook.author.select();
        document.newBook.author.focus();
        return false;
    }

    if (publisher.length < 2 || publisher.length > 12) {
        alert("출판사는 2~12자까지 입력 가능합니다.");

        document.newBook.publisher.select();
        document.newBook.publisher.focus();
        return false;
    }


    if (unitsInStock.length == 0 || isNaN(unitsInStock)) { // 재고 수가 숫자인지 유효성 검사
        alert("재고 수에 숫자만 입력 가능합니다.");

        document.newBook.unitsInStock.select();
        document.newBook.unitsInStock.focus();
        return false;
    }

    if(description.length <= 100){
        alert("입력수 100 미만 ");
        document.newBook.description.select();
        document.newBook.description.focus();
        return false;
    }



    document.newBook.submit();
}