package com.hsl.sns.dao;

import java.util.List;

import com.hsl.sns.dto.CommentDto;
import com.hsl.sns.dto.Criteria;
import com.hsl.sns.dto.FollowDto;
import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PointDto;
import com.hsl.sns.dto.PostDto;
import com.hsl.sns.dto.PostingUrlDto;
import com.hsl.sns.dto.ProductDto;
import com.hsl.sns.dto.ShopPostDto;



public interface IDao {
	
	public void joinMemberDao(String id, String pwd, String name, String birth, String mail, String phone, String nick, String greet);
	public MemberDto memberInfoDao(String id);
	public List<MemberDto> memberListDao(String id);
	public void memberModifyDao(String id, String name, String mail, String nick, String phone, String greet);
	public void messageModifyDao(String snick, String nick);
	public void messageModifyDao1(String snick, String nick);
	public int profileModifyDao(String id, String profilename, String profileurl, String fileextension);
	public void memberDeleteDao(String id);
	public void messageDeleteDao(String nick);
	public MemberDto findIdDao(String name, String mail, String phone);//아이디찾기
	public MemberDto findPwDao(String name, String mail, String phone, String id);//비번찾기
	public MemberDto memberInfoDaoNick(String nick);
	
	
	//contentWrite 관련
	public void contentWriteContDao(String title, String type, int price, String tradeplace, String content, String id); //post write content insert
	public void contentWritePicDao(int postidx, String fileOriName, String fileName, String fileExtension, String fileUrl); //post write imgurl insert
	public List<PostDto> postInfoDao(String id); //파일업로드시 postidx 찾는 DAO
	public int postCountDao(String id); //총게시글 DAO
	
	public List<PostDto> scheduler(String id);
	public List<PostDto> schedulerSell(String id);
	
	//index 관련
	
	public List<PostDto> postListDao(); //index postList
	public List<PostingUrlDto> postUrlListDao(); //index 사진List
	public List<PostingUrlDto> postViewDao(); //contentView
	public MemberDto postInfomationDao(int postidx);
	public List<PostDto> postSearchDao(String tradeplace, String type);
	public List<PostDto> dateDao();
	
	
	//찜
	public void followDao(int followcontent, String followid); 		// 찜하기 버튼 클릭시
	public int followCheckDao(String followid,int followcontent);	// 찜하기 여러번 방지
	public int followCountDao(int followcontent);					// 해당 게시글의 찜하기 수
	public int followerCountDao(String followid);					// 해당 아이디의 찜한 게시글 수
    public List<FollowDto> likeContentListDao(String id);			// 해당 아이디의 찜한 게시글 목록
    
    public void followDeleteDao(String followid,int followcontent);
    
    //프로필 게시물 목록
    public List<PostDto> myPostListDao(String id);	// 내 판매중인 게시물
    public List<PostingUrlDto> myPostUrlListDao();	// 게시글당 사진 한장만 가져오기
    
    //content_view
    public PostDto postDao(int postidx);		// 해당 게시글의 모든 정보
    
	
	//댓글관련
	public void commentDao(String id, int postidx, String content);//댓글입력
	public List<CommentDto> commentListDao(int postidx);//댓글전체리스트
	public PostDto commentViewDao(int postidx);//해당댓글
	
	//트레이드관련
	public void buycompleteDao(int postidx,String buyuser,String selectedDate);
	public MemberDto selltradeDao(int postidx);
	public void sellcompleteDao(int postidx);
	
	
	//예약관련
	public List<PostDto> buyListDao(String buyuser); //예약중인 게시물 목록
	public int buyCountDao(String buyuser); //예약중인 게시물 갯수
	
	//거래완료 관련
	public List<PostDto> transactionListDao(String id); //거래완료 게시물 목록
	public int transactionCountDao(String id); //거래완료 게시물 갯수
	
	//구매요청 관련
	public int buyrequestCountDao(String sid); //예약요청 게시물 갯수
	public int sellrequestCountDao(String sid); //예약완료 게시물 갯수
	
	
	//구매삭제 관련
	public int buyCancleDao(int postidx);
	
	
	//게시물 수정
	public List<PostingUrlDto> getPosturlModifyDao(int postidx);
	public void modifyPostDao(String title, String type, String price, String tradeplace, String content, int postidx);
	
	//게시물 삭제
	public void deletePostDao(int postidx);
	
	//댓글 좋아요
	public int commentLikeDao(int commentidx, String id); //좋아요 버튼 클릭시
	public int CommentLikeCheckDao(String id,int commentidx);	// 좋아요 여러번 방지
	public int CommentLikeCountDao(int commentidx);	// 해당 댓글의 좋아 수
	
	//point
	public void pointPlus(int point, String id);
	public void pointMinus(int point, String id);
	public void pointPlusDao(String id, int point, int currentpoint, String explain);
	public void pointMinusDao(String id, int point, int currentpoint, String explain);
	public List<PointDto> pointListDao(String id,int amount, int pageNum);
	public int pointListAllCount(String id);
	
	//pointshop입력
	public void shopWriteDao(String title, String content, int spoint, String filename, String fileurl, String fileextension); //pointshop write content insert
	public List<ShopPostDto> shopListDao();
	public ShopPostDto shopTrade(int shopidx);
	public void shopModifyDao(int shopidx,String title, String content, int spoint);
	public void shopDeleteDao(int shopidx);
	
	public void pointProductDao(String title, String id, String productAddress, String phone);
	public List<ProductDto> productListDao(int amount, int pageNum);
	public int productCountDao();
}
