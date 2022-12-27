package com.hsl.sns.dao;

import java.util.ArrayList;
import java.util.List;

import com.hsl.sns.dto.FollowDto;
import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PostDto;
import com.hsl.sns.dto.PostingUrlDto;

public interface IDao {
	
	public void joinMemberDao(String id, String pwd, String name, String birth, String mail, String phone, String nick, String profile, String greet);
	public MemberDto memberInfoDao(String id);
	public List<MemberDto> memberListDao(String id);
	public void memberModifyDao(String id, String name, String mail, String nick, String phone, String greet);
	public void memberDeleteDao(String id);
	
	
	//contentWrite 관련
	public void contentWriteContDao(String title, String type, int price, String tradeplace, String content, String id); //post write content insert
	public void contentWritePicDao(int postidx, String fileOriName, String fileName, String fileExtension, String fileUrl); //post write imgurl insert
	public List<PostDto> postInfoDao(String id); 
	public int postCountDao(String id);
	
	//index 관련
	
	public List<PostDto> postListDao();
	public List<PostingUrlDto> postUrlListDao();
	public List<PostingUrlDto> postViewDao();
	public MemberDto postInfomationDao(String postidx);
	
	
	//찜
	public void followDao(int followcontent, String followid); 		// 찜하기 버튼 클릭시
	public int followCheckDao(String followid,int followcontent);	// 찜하기 여러번 방지
	public int followCountDao(int followcontent);					// 해당 게시글의 찜하기 수
	public int followerCountDao(String followid);					// 해당 아이디의 찜한 게시글 수
    public List<FollowDto> likeContentListDao(String id);			// 해당 아이디의 찜한 게시글 목록
    
    //프로필 게시물 목록
    public List<PostDto> myPostListDao(String id);	// 내 판매중인 게시물
    public List<PostingUrlDto> myPostUrlListDao();	// 게시글당 사진 한장만 가져오기
    
    //content_view
    public PostDto postDao(int postidx);		// 해당 게시글의 모든 정보
    
	
}
