VOIPIRAN ChanSpy Pro
# شنود پیشرفته در سیستم‌های تلفنی Issabel و FreePBX

این پروژه به شما امکان می‌دهد انواع مختلف شنود تماس (ChanSpy) را به‌صورت حرفه‌ای روی سیستم‌های Issabel و FreePBX فعال کنید. این قابلیت به‌ویژه در مراکز تماس (Call Center) و سیستم‌های مانیتورینگ کیفیت تماس ارزشمند است.

چرا شنود پیشرفته مهم است؟

در سیستم‌های تلفنی VoIP، مدیر یا ناظر تماس نیاز دارد بدون ایجاد مزاحمت برای مکالمه اصلی، کیفیت سرویس را بررسی کند یا حتی در مواقع اضطراری، به اپراتور کمک کند. ChanSpy این امکان را فراهم می‌کند که:

# نحوه استفاده

پس از نصب، از داخلی خود به این شکل شماره‌گیری کنید:
کد شنود + شماره داخلی مقصد (مثلاً 3010 یعنی شنود ساده داخلی 10)

## حالت‌های شنود

30X – شنود ساده (Listen)
## فقط گوش‌دادن بدون هیچ مداخله‌ای.
مثال: شماره‌گیری 3010 → شنود تماس داخلی 10.

31X – شنود و نجوا (Whisper)
## شنونده می‌تواند فقط با اپراتور صحبت کند و مشتری نمی‌شنود.
مثال: شماره‌گیری 3110 → راهنمایی پنهانی اپراتور داخلی 10.

32X – شنود فقط کارشناس (Agent Only Listen)
## فقط صدای کارشناس شنیده می‌شود (صدای مشتری شنیده نمی‌شود).
مثال: شماره‌گیری 3210 → بررسی کیفیت پاسخ داخلی 10.

33X – نجوا خصوصی (Private Whisper)
## فقط صحبت مستقیم با کارشناس بدون شنود طرف دیگر.
مثال: شماره‌گیری 3310 → گفت‌وگوی خصوصی با داخلی 10 بدون شنود تماس.

34X – ورود به تماس (Barge)
## ورود کامل به مکالمه و صحبت هم‌زمان با هر دو طرف.
مثال: شماره‌گیری 3410 → مشارکت مستقیم در تماس داخلی 10.

35X – شنود با تغییر حالت (DTMF Control)
## امکان تغییر حالت شنود در حین تماس با کلیدهای DTMF:

4 → فقط شنود
5 → نجوا با اپراتور
6 → ورود به تماس
مثال: شماره‌گیری 3510 → شروع شنود داخلی 10 و کنترل با کلیدها.


## Give a Star! ⭐ یک ستاره با ما بدهید
If you like this project or plan to use it in the future, please give it a star. Thanks 🙏


English Section
VOIPIRAN ChanSpy Pro – Advanced Call Monitoring for Issabel & FreePBX

This project enables advanced call monitoring modes (ChanSpy) for Asterisk-based PBXs such as Issabel and FreePBX. It is especially valuable for call centers and quality assurance teams.

Why is this important?
Supervisors can listen to live calls, coach agents in real time, or even barge into calls when necessary — without disrupting customer experience unnecessarily.

Modes included:

30X. – Standard spy (listen silently)

31X. – Outgoing audio only (hear only the agent’s voice)

32X. – Whisper mode (coach the agent without the customer hearing)

33X. – Private whisper (talk to the agent without hearing the customer)

34X. – Barge mode (join the call as a 3rd participant)

Quick Install Command:
```
curl -L -o voipiran_chanspy.zip https://github.com/voipiran/VOIPIRAN-ChanSpyPro/archive/master.zip && unzip voipiran_chanspy.zip && cd VOIPIRAN-ChanSpyPro-master && chmod 755 install_voipiran_chanspy.sh && ./install_voipiran_chanspy.sh -y

```
