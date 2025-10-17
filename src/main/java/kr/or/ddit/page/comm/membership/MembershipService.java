package kr.or.ddit.page.comm.membership;

public interface MembershipService {

	boolean registerMembership(int groupNo, String memId);
//    boolean registerMembership(int commRegNo, String memId);

	boolean isMembershipActive(int groupNo, String memId);

}
