// 글 날짜는 KST 기준으로 표시한다 (빌드 머신 TZ 무관 — CI는 UTC).
const kstFormatter = new Intl.DateTimeFormat('en-CA', {
    timeZone: 'Asia/Seoul',
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
});

// 'YYYY-MM-DD' (en-CA 로케일의 ISO 표기 활용)
export function kstDateParts(date) {
    const [year, month, day] = kstFormatter.format(date).split('-');
    return { year, month, day };
}

export function day(date) {
    return kstDateParts(date).day;
}

export function yearMonth(date) {
    const { year, month } = kstDateParts(date);
    return `${year}-${month}`;
}
