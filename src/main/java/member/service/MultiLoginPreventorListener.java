package member.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MultiLoginPreventorListener implements HttpSessionBindingListener {
	// 싱글톤으로 관리한다.
	private static MultiLoginPreventorListener instance = new MultiLoginPreventorListener();
	private MultiLoginPreventorListener() { ; }
	public static MultiLoginPreventorListener getInstance(){
		return instance; 
	}
	
	private static Logger logger = LoggerFactory.getLogger(MultiLoginPreventorListener.class);
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	
	// 로그인한 세션을 저장할 맵을 필드로 작성한다.
	private static Map<String, HttpSession> usersMap = new ConcurrentHashMap<String, HttpSession>();
	
	// 아이디가 로그인한 사용자중에 있는지 검사하는 메소드
	public boolean findByLoginId(String userid){
		return usersMap.keySet().contains(userid);
	}
	// 이미 로그인되어 있는 사용자의 세션을 강제로 해제하는 메소드
	public void invalidateByLoginId(String userid){
		if(findByLoginId(userid)) usersMap.get(userid).invalidate();
	}
	// 현재 맵에 저장된 로그인 세션의 개수를 리턴하는 메소드
	public int getTotalActiveSession(){
		return usersMap.size();
	}
	// 현재 로그인되어있는 사용자 목록을 출력하는 메소드
	private void viewLoginUsers() {
		Iterator<String> it = usersMap.keySet().iterator();
		logger.debug("-----------------------");
		logger.debug("  로그인 사용자 목록 ");
		logger.debug("-----------------------");
		while(it.hasNext()){
			logger.debug(it.next());
		}
		logger.debug("-----------------------");
	}
	// 사용자 등록
	public void addUser(String userid, HttpSession httpSession){
		httpSession.setAttribute(userid, this);
		httpSession.setAttribute("userId", userid);
	}
	// 사용자 제거
	public void removeUser(String userid){
		if(findByLoginId(userid)) usersMap.remove(userid);
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		if(findByLoginId(event.getName())){
			invalidateByLoginId(event.getName());
		}
		usersMap.put(event.getName(), event.getSession());
		logger.debug("MultiLoginBindingListener : {}","valueBound 메소드 호출");
    	logger.debug("{}님({}) 로그인!",event.getName(), sdf.format(new Date()));
    	viewLoginUsers();
	}
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		removeUser(event.getName());
    	logger.debug("MultiLoginBindingListener : {}","valueUnbound 메소드 호출");
    	logger.debug("{}님({}) 로그아웃!",event.getName(), sdf.format(new Date()));
    	viewLoginUsers();
	}
}
