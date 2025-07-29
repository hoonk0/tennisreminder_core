import 'keys.dart';

/// 로그인 유형
enum LoginType {
  apple,
  kakao,
  naver,
  google,
  email,
}

/// 유저 유형
enum UserType {
  user,
  admin,
}

/// 서울특별시 자치구
enum SeoulDistrict {
  //all,
  gangnam,       // 강남구
  gangdong,      // 강동구
  gangbuk,       // 강북구
  gangseo,       // 강서구
  gwanak,        // 관악구
  gwangjin,      // 광진구
  guro,          // 구로구
  geumcheon,     // 금천구
  nowon,         // 노원구
  dobong,        // 도봉구
  dongdaemun,    // 동대문구
  dongjak,       // 동작구
  mapo,          // 마포구
  seodaemun,     // 서대문구
  seocho,        // 서초구
  seongdong,     // 성동구
  seongbuk,      // 성북구
  songpa,        // 송파구
  yangcheon,     // 양천구
  yeongdeungpo,  // 영등포구
  yongsan,       // 용산구
  eunpyeong,     // 은평구
  jongno,        // 종로구
  jung,          // 중구
  jungnang,// 중랑구

}

/// 요일 (월~일)
enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

///예약유형
enum ReservationRuleType {
  fixedDayEachMonth,    // 매달 특정일
  daysBeforePlay,       // 플레이 날짜 기준 n일 전
  nthWeekdayOfMonth,    // 매달 n번째 특정 요일
  etc,                  // 기타
}

/// 게시판 상태 (양도/교환 + 진행/완료)
enum TradeState {
  exchangeOngoing,  // 교환 진행 중
  transferOngoing,  // 양도 진행 중
  done,     // 양도 완료
  // 교환 완료
}

/// 라켓 브랜드
enum RacketBrand {
  wilson,
  babolat,
  head,
  yonex,
  prince,
  tecnifibre,
  dunlop,
  volkl,
  prokennex,
  slazenger,
  solinco,
  pacific,
  artengo,
}
