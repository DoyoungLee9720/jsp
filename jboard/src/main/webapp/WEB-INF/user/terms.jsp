<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<script>
    window.onload = function() {
        function goNext() {
            var chk1 = document.getElementById('chk1').checked;
            var chk2 = document.getElementById('chk2').checked;

            if (chk1 && chk2) {
                window.location.href = "/jboard/user/register.do";
            } else {
                alert('약관과 개인정보 처리방침에 모두 동의해주세요.');
            }
        }
        
        // "다음" 버튼 클릭 시 goNext 함수 실행
        document.querySelector('.btnNext').addEventListener('click', goNext);
    };
</script>
<main>
    <section class="terms">
        <table>
            <caption>사이트 이용약관</caption>
            <tr>
                <td>
                    <textarea readonly>${termsDto.terms}</textarea>
                    <p>
                        <label><input type="checkbox" name="chk1" id="chk1"/>동의합니다.</label>
                    </p>
                </td>
            </tr>
        </table>
        <table>
            <caption>개인정보 취급방침</caption>
            <tr>
                <td>
                    <textarea readonly>${termsDto.privacy}</textarea>
                    <p>
                        <label><input type="checkbox" name="chk2" id="chk2"/>동의합니다.</label>
                    </p>
                </td>
            </tr>
        </table>
        <div>
            <a href="/jboard/user/login.do" class="btnCancel">취소</a>
            <a class="btnNext">다음</a>
        </div>
    </section>
</main>
<%@ include file="./_footer.jsp" %>








