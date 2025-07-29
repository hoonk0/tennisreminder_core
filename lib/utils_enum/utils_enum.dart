
import '../const/value/enum.dart';

class UtilsEnum {
 /* /// Subject 한글 받아오기
  static String getNameFromSubject(Subject subject) {
    switch (subject) {
      case Subject.sports_education:
        return '스포츠 교육학';
      case Subject.sports_sociology:
        return '스포츠 사회학';
      case Subject.sports_psychology:
        return '스포츠 심리학';
      case Subject.sports_ethics:
        return '스포츠 윤리';
      case Subject.exercise_physiology:
        return '운동생리학';
      case Subject.kinematics:
        return '운동역학';
      case Subject.korean_sports_history:
        return '한국체육학';
    }
  }
/// 과목 영어로 받아오기
  static Subject getSubjectFromName(String name) {
    switch (name.trim()) {
      case '스포츠 교육학':
        return Subject.sports_education;
      case '스포츠 사회학':
        return Subject.sports_sociology;
      case '스포츠 심리학':
        return Subject.sports_psychology;
      case '스포츠 윤리':
        return Subject.sports_ethics;
      case '운동생리학':
        return Subject.exercise_physiology;
      case '운동역학':
        return Subject.kinematics;
      case '한국체육학':
        return Subject.korean_sports_history;
      default:
        throw Exception('Unknown subject name: $name');
    }
  }

  /// Article 한글 받아오기
  static String getNameFromArticleType(ArticleType articleType) {
    switch (articleType) {
      case ArticleType.all:
        return '카테고리 전체';
      case ArticleType.main:
        return '좋은몸언론사';
      case ArticleType.health:
        return '건강';
      case ArticleType.medical:
        return '의학';
      case ArticleType.sports:
        return '스포츠';
      case ArticleType.issue:
        return '일산,연예,이슈';
      case ArticleType.etc:
        return '기사모음';
    }
  }

  /// Article 한글 받아오기
  static ArticleType getArticleTypeFromName(String articleType) {
    switch (articleType) {
      case '좋은몸언론사':
        return ArticleType.main;
      case '건강':
        return ArticleType.health;
      case '의학':
        return ArticleType.medical;
      case '스포츠':
        return ArticleType.sports;
      case '일산,연예,이슈':
        return ArticleType.issue;
      case '기사모음':
        return ArticleType.etc;
      default:
        return ArticleType.etc;
    }
  }

  /// SortOption 한글 받아오기
  static String getSortOptionText(SortOption option) {
    switch (option) {
      case SortOption.newest:
        return '최신순';
      case SortOption.oldest:
        return '오래된순';
    }
  }

  /// TestYear 한글 받아오기
  static String getYearText(TestYear year) {
    return year.name.substring(1) + '년'; // 'y2024' -> '2024년'
  }

  /// TestYear 오름차순 정렬
  static List<String> getSortedTestYears() {
    return TestYear.values.reversed.map((e) => getYearText(e)).toList();
  }

  /// 심리 테스트 카테고리 한글 받아오기
  static String getNameFromPsychologyCategory(PsychologyCategory category) {
    switch (category) {
      case PsychologyCategory.study_stress:
        return '학업 스트레스';
      case PsychologyCategory.work_stress:
        return '직무 스트레스';
      case PsychologyCategory.etc_stress:
        return '기타 스트레스';
    }
  }

  /// 건강 테스트 카테고리 한글 받아오기
  static String getNameFromHealthCategory(HealthCategory category) {
    switch (category) {
      case HealthCategory.eating_habit:
        return '식습관';
      case HealthCategory.joint:
        return '관절';
      case HealthCategory.etc_health:
        return '건강 기타';
    }
  }
  /// FieldSub enum → 한글명 반환
  static String getNameFromFieldSub(FieldSub fieldSub) {
    switch (fieldSub) {
      case FieldSub.upper_body:
        return '상체';
      case FieldSub.lower_body:
        return '하체';
    }
  }

  /// FieldSubDetail enum → 한글명 반환
  static String getNameFromFieldSubDetail(FieldSubDetail detail) {
    switch (detail) {
      case FieldSubDetail.chest_arm:
        return '가슴·팔';
      case FieldSubDetail.back_shoulder:
        return '등·어깨';
      case FieldSubDetail.abs_full:
        return '복근·전신';
    }
  }

*/
///로그인 타입
  static String getLoginTypeName(LoginType loginType) {
    switch (loginType) {
      case LoginType.apple:
        return 'Apple';
      case LoginType.kakao:
        return 'Kakao';
      case LoginType.naver:
        return 'Naver';
      case LoginType.google:
        return 'Google';
      case LoginType.email:
        return 'Email';
    }
  }

  /// 서울 자치구 → 한글명 반환
  static String getNameFromSeoulDistrict(SeoulDistrict district) {
    switch (district) {
/*      case SeoulDistrict.all:
        return '전체';*/
      case SeoulDistrict.gangnam:
        return '강남구';
      case SeoulDistrict.gangdong:
        return '강동구';
      case SeoulDistrict.gangbuk:
        return '강북구';
      case SeoulDistrict.gangseo:
        return '강서구';
      case SeoulDistrict.gwanak:
        return '관악구';
      case SeoulDistrict.gwangjin:
        return '광진구';
      case SeoulDistrict.guro:
        return '구로구';
      case SeoulDistrict.geumcheon:
        return '금천구';
      case SeoulDistrict.nowon:
        return '노원구';
      case SeoulDistrict.dobong:
        return '도봉구';
      case SeoulDistrict.dongdaemun:
        return '동대문구';
      case SeoulDistrict.dongjak:
        return '동작구';
      case SeoulDistrict.mapo:
        return '마포구';
      case SeoulDistrict.seodaemun:
        return '서대문구';
      case SeoulDistrict.seocho:
        return '서초구';
      case SeoulDistrict.seongdong:
        return '성동구';
      case SeoulDistrict.seongbuk:
        return '성북구';
      case SeoulDistrict.songpa:
        return '송파구';
      case SeoulDistrict.yangcheon:
        return '양천구';
      case SeoulDistrict.yeongdeungpo:
        return '영등포구';
      case SeoulDistrict.yongsan:
        return '용산구';
      case SeoulDistrict.eunpyeong:
        return '은평구';
      case SeoulDistrict.jongno:
        return '종로구';
      case SeoulDistrict.jung:
        return '중구';
      case SeoulDistrict.jungnang:
        return '중랑구';

    }
  }

  /// 요일 enum → 한글명 반환
  static String getNameFromWeekday(Weekday weekday) {
    switch (weekday) {
      case Weekday.monday:
        return '월요일';
      case Weekday.tuesday:
        return '화요일';
      case Weekday.wednesday:
        return '수요일';
      case Weekday.thursday:
        return '목요일';
      case Weekday.friday:
        return '금요일';
      case Weekday.saturday:
        return '토요일';
      case Weekday.sunday:
        return '일요일';
    }
  }

  /// TradeState enum → 한글명 반환
  static String getNameFromTradeState(TradeState state) {
    switch (state) {
      case TradeState.exchangeOngoing:
        return '교환';
      case TradeState.transferOngoing:
        return '양도';
      case TradeState.done:
        return '완료';

    }
  }


  /// Firestore 문자열 값을 받아 TradeState → 한글명 반환
  static String getNameFromTradeStateRaw(dynamic raw) {
    final name = (raw ?? '').toString().trim();
    final state = TradeState.values.firstWhere(
      (e) => e.name == name,
      orElse: () => TradeState.transferOngoing, // 기본값 지정
    );
    return getNameFromTradeState(state);
  }

  /// Firestore 문자열 값을 받아 TradeState enum 반환
  static TradeState getTradeStateFromRaw(dynamic raw) {
    final name = (raw ?? '').toString().trim();
    return TradeState.values.firstWhere(
      (e) => e.name == name,
      orElse: () => TradeState.transferOngoing, // 기본값 지정
    );
  }

  /// RacketBrand enum → 한글명 반환
  static String getNameFromRacketBrand(RacketBrand brand) {
    switch (brand) {
      case RacketBrand.wilson:
        return 'Wilson';
      case RacketBrand.babolat:
        return 'Babolat';
      case RacketBrand.head:
        return 'Head';
      case RacketBrand.yonex:
        return 'Yonex';
      case RacketBrand.prince:
        return 'Prince';
      case RacketBrand.tecnifibre:
        return 'Tecnifibre';
      case RacketBrand.dunlop:
        return 'Dunlop';
      case RacketBrand.volkl:
        return 'Volkl';
      case RacketBrand.prokennex:
        return 'ProKennex';
      case RacketBrand.slazenger:
        return 'Slazenger';
      case RacketBrand.solinco:
        return 'Solinco';
      case RacketBrand.pacific:
        return 'Pacific';
      case RacketBrand.artengo:
        return 'Artengo';
    }
  }



}

