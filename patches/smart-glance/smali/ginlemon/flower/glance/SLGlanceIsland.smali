.class public final Lginlemon/flower/glance/SLGlanceIsland;
.super Landroid/widget/FrameLayout;
.source "SLGlanceIsland.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;
    }
.end annotation


# static fields
.field private static final PREF:Ljava/lang/String; = "sl_glance_island_v1"

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private active:Z

.field private final agenda:Landroid/content/SharedPreferences;

.field private final agendaChanged:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

.field private battery:I

.field private final calendarChanged:Landroid/database/ContentObserver;

.field private calendarItem:Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

.field private final controllers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/media/session/MediaController;",
            ">;"
        }
    .end annotation
.end field

.field private dialog:Landroid/app/AlertDialog;

.field private event:Ljava/lang/String;

.field private generation:I

.field private final listener:Landroid/content/ComponentName;

.field private final main:Landroid/os/Handler;

.field private final media:Landroid/media/session/MediaSessionManager;

.field private final mediaChanged:Landroid/media/session/MediaController$Callback;

.field private mediaRegistered:Z

.field private observerRegistered:Z

.field private final pill:Landroid/widget/TextView;

.field private playing:Landroid/media/session/MediaController;

.field private final prefs:Landroid/content/SharedPreferences;

.field private final receiver:Landroid/content/BroadcastReceiver;

.field private receiverRegistered:Z

.field private final rect:Landroid/graphics/Rect;

.field private selected:Landroid/media/session/MediaController;

.field private final sessionsChanged:Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;

.field private task:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 55
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lginlemon/flower/glance/SLGlanceIsland;->WORK:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 11

    .prologue
    const/16 v7, 0x11

    const/4 v6, 0x1

    const/4 v5, -0x1

    const/high16 v4, 0x41900000    # 18.0f

    const/4 v3, 0x0

    .line 75
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->main:Landroid/os/Handler;

    .line 58
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->rect:Landroid/graphics/Rect;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->controllers:Ljava/util/ArrayList;

    .line 64
    iput v5, p0, Lginlemon/flower/glance/SLGlanceIsland;->battery:I

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->event:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->task:Ljava/lang/String;

    .line 148
    new-instance v0, Lginlemon/flower/glance/SLGlanceIsland$3;

    invoke-direct {v0, p0}, Lginlemon/flower/glance/SLGlanceIsland$3;-><init>(Lginlemon/flower/glance/SLGlanceIsland;)V

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->receiver:Landroid/content/BroadcastReceiver;

    .line 162
    new-instance v0, Lginlemon/flower/glance/SLGlanceIsland$4;

    invoke-direct {v0, p0}, Lginlemon/flower/glance/SLGlanceIsland$4;-><init>(Lginlemon/flower/glance/SLGlanceIsland;)V

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->agendaChanged:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 167
    new-instance v0, Lginlemon/flower/glance/SLGlanceIsland$5;

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->main:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lginlemon/flower/glance/SLGlanceIsland$5;-><init>(Lginlemon/flower/glance/SLGlanceIsland;Landroid/os/Handler;)V

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->calendarChanged:Landroid/database/ContentObserver;

    .line 170
    new-instance v0, Lginlemon/flower/glance/SLGlanceIsland$6;

    invoke-direct {v0, p0}, Lginlemon/flower/glance/SLGlanceIsland$6;-><init>(Lginlemon/flower/glance/SLGlanceIsland;)V

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->sessionsChanged:Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;

    .line 171
    new-instance v0, Lginlemon/flower/glance/SLGlanceIsland$7;

    invoke-direct {v0, p0}, Lginlemon/flower/glance/SLGlanceIsland$7;-><init>(Lginlemon/flower/glance/SLGlanceIsland;)V

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->mediaChanged:Landroid/media/session/MediaController$Callback;

    .line 76
    const-string v0, "sl_glance_island_v1"

    invoke-virtual {p1, v0, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->prefs:Landroid/content/SharedPreferences;

    .line 77
    const-string v0, "sl_agenda_panel_v1"

    invoke-virtual {p1, v0, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->agenda:Landroid/content/SharedPreferences;

    .line 78
    const-string v0, "media_session"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/session/MediaSessionManager;

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->media:Landroid/media/session/MediaSessionManager;

    .line 79
    new-instance v0, Landroid/content/ComponentName;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ginlemon.notifications.listener.NotificationListener"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->listener:Landroid/content/ComponentName;

    .line 80
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    .line 81
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 82
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 83
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 84
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 85
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 86
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 87
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    invoke-direct {p0, v4}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v1

    invoke-direct {p0, v4}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v2

    invoke-virtual {v0, v1, v3, v2, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 88
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    const/high16 v1, 0x42c00000    # 96.0f

    invoke-direct {p0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 89
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    const/high16 v1, 0x438c0000    # 280.0f

    invoke-direct {p0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 90
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 91
    const v1, -0x47d5d5d2

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 92
    const/high16 v1, 0x41e00000    # 28.0f

    invoke-direct {p0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 93
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v1

    const v2, 0x55ffffff    # 3.518437E13f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 94
    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 95
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    const/high16 v1, 0x40800000    # 4.0f

    invoke-direct {p0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setElevation(F)V

    .line 96
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x42300000    # 44.0f

    invoke-direct {p0, v2}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v2

    invoke-direct {v0, v1, v2, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 97
    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    invoke-virtual {p0, v1, v0}, Lginlemon/flower/glance/SLGlanceIsland;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    new-instance v1, Lginlemon/flower/glance/SLGlanceIsland$1;

    invoke-direct {v1, p0}, Lginlemon/flower/glance/SLGlanceIsland$1;-><init>(Lginlemon/flower/glance/SLGlanceIsland;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    new-instance v1, Lginlemon/flower/glance/SLGlanceIsland$2;

    invoke-direct {v1, p0}, Lginlemon/flower/glance/SLGlanceIsland$2;-><init>(Lginlemon/flower/glance/SLGlanceIsland;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 100
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->updatePill()V

    .line 101
    return-void
.end method

.method static synthetic access$000(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->showDetails()V

    return-void
.end method

.method static synthetic access$100(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->showSettings()V

    return-void
.end method

.method static synthetic access$1000(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->reconnectMedia()V

    return-void
.end method

.method static synthetic access$1100(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 53
    invoke-static {p0}, Lginlemon/flower/glance/SLGlanceIsland;->findTask(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200(Lginlemon/flower/glance/SLGlanceIsland;)Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->findEvent()Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300(Lginlemon/flower/glance/SLGlanceIsland;)I
    .registers 2

    .prologue
    .line 53
    iget v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->generation:I

    return v0
.end method

.method static synthetic access$1402(Lginlemon/flower/glance/SLGlanceIsland;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 53
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland;->task:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1500(Lginlemon/flower/glance/SLGlanceIsland;)Landroid/os/Handler;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->main:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1600(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->requestCalendar()V

    return-void
.end method

.method static synthetic access$1700(Lginlemon/flower/glance/SLGlanceIsland;)Landroid/app/AlertDialog;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->dialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1800(Lginlemon/flower/glance/SLGlanceIsland;Ljava/lang/String;Z)Z
    .registers 4

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1900(Lginlemon/flower/glance/SLGlanceIsland;)Landroid/content/SharedPreferences;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->prefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$200(Lginlemon/flower/glance/SLGlanceIsland;)Z
    .registers 2

    .prologue
    .line 53
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    return v0
.end method

.method static synthetic access$2000(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->move()V

    return-void
.end method

.method static synthetic access$2100(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->stop()V

    return-void
.end method

.method static synthetic access$2200(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->start()V

    return-void
.end method

.method static synthetic access$2300(Lginlemon/flower/glance/SLGlanceIsland;)Z
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->calendarAllowed()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2400(Lginlemon/flower/glance/SLGlanceIsland;)Z
    .registers 2

    .prologue
    .line 53
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->mediaRegistered:Z

    return v0
.end method

.method static synthetic access$302(Lginlemon/flower/glance/SLGlanceIsland;I)I
    .registers 2

    .prologue
    .line 53
    iput p1, p0, Lginlemon/flower/glance/SLGlanceIsland;->battery:I

    return p1
.end method

.method static synthetic access$400(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->updatePill()V

    return-void
.end method

.method static synthetic access$500(Lginlemon/flower/glance/SLGlanceIsland;)Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->calendarItem:Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    return-object v0
.end method

.method static synthetic access$502(Lginlemon/flower/glance/SLGlanceIsland;Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;)Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;
    .registers 2

    .prologue
    .line 53
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland;->calendarItem:Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    return-object p1
.end method

.method static synthetic access$600(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->refreshData()V

    return-void
.end method

.method static synthetic access$700(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->updateCalendarDisplay()V

    return-void
.end method

.method static synthetic access$800(Lginlemon/flower/glance/SLGlanceIsland;Ljava/util/List;)V
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lginlemon/flower/glance/SLGlanceIsland;->bindSessions(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$900(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->selectPlaying()V

    return-void
.end method

.method private activity()Landroid/app/Activity;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 106
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 107
    :goto_5
    instance-of v0, v1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_19

    instance-of v0, v1, Landroid/app/Activity;

    if-nez v0, :cond_19

    move-object v0, v1

    .line 108
    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 109
    if-ne v0, v1, :cond_17

    .line 112
    :goto_16
    return-object v2

    :cond_17
    move-object v1, v0

    .line 111
    goto :goto_5

    .line 112
    :cond_19
    instance-of v0, v1, Landroid/app/Activity;

    if-eqz v0, :cond_21

    check-cast v1, Landroid/app/Activity;

    :goto_1f
    move-object v2, v1

    goto :goto_16

    :cond_21
    move-object v1, v2

    goto :goto_1f
.end method

.method private addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 8

    .prologue
    const/4 v3, 0x0

    const/high16 v2, 0x41400000    # 12.0f

    .line 330
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 331
    invoke-direct {p0, v2}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v1

    invoke-direct {p0, v2}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v2

    invoke-virtual {v0, v3, v1, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 332
    if-eqz p3, :cond_2c

    new-instance v1, Lginlemon/flower/glance/SLGlanceIsland$12;

    invoke-direct {v1, p0, p3}, Lginlemon/flower/glance/SLGlanceIsland$12;-><init>(Lginlemon/flower/glance/SLGlanceIsland;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 333
    :cond_2c
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 334
    return-void
.end method

.method private bindSessions(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/media/session/MediaController;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 219
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    if-nez v0, :cond_5

    .line 224
    :goto_4
    return-void

    .line 220
    :cond_5
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->controllers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/session/MediaController;

    iget-object v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->mediaChanged:Landroid/media/session/MediaController$Callback;

    invoke-virtual {v0, v2}, Landroid/media/session/MediaController;->unregisterCallback(Landroid/media/session/MediaController$Callback;)V

    goto :goto_b

    .line 221
    :cond_1d
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->controllers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 222
    if-eqz p1, :cond_41

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_28
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/session/MediaController;

    iget-object v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->controllers:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->mediaChanged:Landroid/media/session/MediaController$Callback;

    iget-object v3, p0, Lginlemon/flower/glance/SLGlanceIsland;->main:Landroid/os/Handler;

    invoke-virtual {v0, v2, v3}, Landroid/media/session/MediaController;->registerCallback(Landroid/media/session/MediaController$Callback;Landroid/os/Handler;)V

    goto :goto_28

    .line 223
    :cond_41
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->selectPlaying()V

    goto :goto_4
.end method

.method private calendarAllowed()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 202
    const-string v1, "calendar"

    invoke-direct {p0, v1, v0}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "android.permission.READ_CALENDAR"

    invoke-virtual {v1, v2}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_16

    const/4 v0, 0x1

    :cond_16
    return v0
.end method

.method private dp(F)I
    .registers 3

    .prologue
    .line 103
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private enabled(Ljava/lang/String;Z)Z
    .registers 4

    .prologue
    .line 104
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private findEvent()Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;
    .registers 12

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 287
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 288
    sget-object v2, Landroid/provider/CalendarContract$Instances;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    .line 289
    invoke-static {v3, v0, v1}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    const-wide/32 v4, 0x5265c00

    add-long/2addr v0, v4

    invoke-static {v3, v0, v1}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 290
    const/4 v0, 0x4

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "title"

    aput-object v0, v2, v7

    const-string v0, "begin"

    aput-object v0, v2, v8

    const-string v0, "end"

    aput-object v0, v2, v9

    const-string v0, "allDay"

    aput-object v0, v2, v10

    .line 292
    :try_start_2c
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "begin ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_3f
    .catch Ljava/lang/RuntimeException; {:try_start_2c .. :try_end_3f} :catch_7d

    move-result-object v7

    .line 293
    if-eqz v7, :cond_6f

    :cond_42
    :try_start_42
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_6f

    .line 294
    const/4 v0, 0x3

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-nez v0, :cond_42

    .line 295
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 296
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_42

    new-instance v0, Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    const/4 v2, 0x1

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    const/4 v4, 0x2

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;-><init>(Ljava/lang/String;JJ)V
    :try_end_69
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_69} :catch_76
    .catch Ljava/lang/RuntimeException; {:try_start_42 .. :try_end_69} :catch_7d

    .line 298
    if-eqz v7, :cond_6e

    :try_start_6b
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 299
    :cond_6e
    :goto_6e
    return-object v0

    .line 298
    :cond_6f
    if-eqz v7, :cond_74

    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_74
    .catch Ljava/lang/RuntimeException; {:try_start_6b .. :try_end_74} :catch_7d

    :cond_74
    :goto_74
    move-object v0, v6

    .line 299
    goto :goto_6e

    .line 292
    :catch_76
    move-exception v0

    if-eqz v7, :cond_7c

    :try_start_79
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_7c
    .catch Ljava/lang/Throwable; {:try_start_79 .. :try_end_7c} :catch_7f
    .catch Ljava/lang/RuntimeException; {:try_start_79 .. :try_end_7c} :catch_7d

    :cond_7c
    :goto_7c
    :try_start_7c
    throw v0

    .line 298
    :catch_7d
    move-exception v0

    goto :goto_74

    .line 292
    :catch_7f
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_83
    .catch Ljava/lang/RuntimeException; {:try_start_7c .. :try_end_83} :catch_7d

    goto :goto_7c
.end method

.method private static findTask(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v6, 0x2

    const/4 v0, 0x0

    .line 266
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 268
    :try_start_14
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    move v1, v0

    .line 269
    :goto_1a
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v1, v0, :cond_5e

    .line 270
    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 271
    if-eqz v0, :cond_59

    const-string v4, "type"

    const/4 v5, 0x2

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v6, :cond_59

    const-string v4, "completed"

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_59

    const-string v4, "dateKey"

    const-string v5, ""

    .line 272
    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_59

    .line 273
    const-string v4, "title"

    const-string v5, ""

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 274
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_55} :catch_5d

    move-result v4

    if-nez v4, :cond_59

    .line 278
    :goto_58
    return-object v0

    .line 269
    :cond_59
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1a

    .line 277
    :catch_5d
    move-exception v0

    .line 278
    :cond_5e
    const-string v0, ""

    goto :goto_58
.end method

.method private move()V
    .registers 5

    .prologue
    .line 115
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/FrameLayout$LayoutParams;

    if-nez v0, :cond_9

    .line 120
    :goto_8
    return-void

    .line 116
    :cond_9
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 117
    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "bottom"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_34

    const/16 v1, 0x50

    :goto_1c
    or-int/lit8 v1, v1, 0x1

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 118
    const/high16 v1, 0x42800000    # 64.0f

    invoke-direct {p0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v1

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    const/high16 v1, 0x42c00000    # 96.0f

    invoke-direct {p0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v1

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 119
    invoke-virtual {p0, v0}, Lginlemon/flower/glance/SLGlanceIsland;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_8

    .line 117
    :cond_34
    const/16 v1, 0x30

    goto :goto_1c
.end method

.method private musicTitle()Ljava/lang/String;
    .registers 3

    .prologue
    .line 236
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->selected:Landroid/media/session/MediaController;

    if-nez v0, :cond_7

    const-string v0, ""

    .line 239
    :goto_6
    return-object v0

    .line 237
    :cond_7
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->selected:Landroid/media/session/MediaController;

    invoke-virtual {v0}, Landroid/media/session/MediaController;->getMetadata()Landroid/media/MediaMetadata;

    move-result-object v0

    .line 238
    if-nez v0, :cond_1b

    const/4 v0, 0x0

    .line 239
    :goto_10
    if-eqz v0, :cond_18

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_22

    :cond_18
    const-string v0, "Music"

    goto :goto_6

    .line 238
    :cond_1b
    const-string v1, "android.media.metadata.TITLE"

    invoke-virtual {v0, v1}, Landroid/media/MediaMetadata;->getText(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_10

    .line 239
    :cond_22
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method private reconnectMedia()V
    .registers 5

    .prologue
    .line 210
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->unbindMedia()V

    .line 211
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    if-eqz v0, :cond_14

    const-string v0, "music"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->media:Landroid/media/session/MediaSessionManager;

    if-nez v0, :cond_18

    :cond_14
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->updatePill()V

    .line 217
    :goto_17
    return-void

    .line 213
    :cond_18
    :try_start_18
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->media:Landroid/media/session/MediaSessionManager;

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->sessionsChanged:Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;

    iget-object v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->listener:Landroid/content/ComponentName;

    iget-object v3, p0, Lginlemon/flower/glance/SLGlanceIsland;->main:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/session/MediaSessionManager;->addOnActiveSessionsChangedListener(Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;Landroid/content/ComponentName;Landroid/os/Handler;)V

    .line 214
    const/4 v0, 0x1

    iput-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->mediaRegistered:Z

    .line 215
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->media:Landroid/media/session/MediaSessionManager;

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->listener:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Landroid/media/session/MediaSessionManager;->getActiveSessions(Landroid/content/ComponentName;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lginlemon/flower/glance/SLGlanceIsland;->bindSessions(Ljava/util/List;)V
    :try_end_31
    .catch Ljava/lang/SecurityException; {:try_start_18 .. :try_end_31} :catch_32

    goto :goto_17

    .line 216
    :catch_32
    move-exception v0

    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->updatePill()V

    goto :goto_17
.end method

.method private refreshData()V
    .registers 6

    .prologue
    .line 251
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    if-nez v0, :cond_5

    .line 264
    :goto_4
    return-void

    .line 252
    :cond_5
    iget v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->generation:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->generation:I

    .line 253
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->calendarAllowed()Z

    move-result v2

    .line 254
    const-string v0, "agenda"

    const/4 v3, 0x1

    invoke-direct {p0, v0, v3}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v0

    .line 255
    if-eqz v0, :cond_2d

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->agenda:Landroid/content/SharedPreferences;

    const-string v3, "items_json"

    const-string v4, "[]"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 256
    :goto_22
    sget-object v3, Lginlemon/flower/glance/SLGlanceIsland;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lginlemon/flower/glance/SLGlanceIsland$8;

    invoke-direct {v4, p0, v0, v2, v1}, Lginlemon/flower/glance/SLGlanceIsland$8;-><init>(Lginlemon/flower/glance/SLGlanceIsland;Ljava/lang/String;ZI)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_4

    .line 255
    :cond_2d
    const-string v0, "[]"

    goto :goto_22
.end method

.method private requestCalendar()V
    .registers 5

    .prologue
    .line 336
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_13

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "android.permission.READ_CALENDAR"

    aput-object v3, v1, v2

    const/16 v2, 0x230b

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 337
    :cond_13
    return-void
.end method

.method private selectPlaying()V
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 226
    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->playing:Landroid/media/session/MediaController;

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->selected:Landroid/media/session/MediaController;

    .line 227
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->controllers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/session/MediaController;

    .line 228
    invoke-virtual {v0}, Landroid/media/session/MediaController;->getPlaybackState()Landroid/media/session/PlaybackState;

    move-result-object v2

    .line 229
    if-eqz v2, :cond_b

    .line 230
    iget-object v3, p0, Lginlemon/flower/glance/SLGlanceIsland;->selected:Landroid/media/session/MediaController;

    if-nez v3, :cond_2a

    invoke-virtual {v2}, Landroid/media/session/PlaybackState;->getState()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2a

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->selected:Landroid/media/session/MediaController;

    .line 231
    :cond_2a
    invoke-virtual {v2}, Landroid/media/session/PlaybackState;->getState()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_b

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->playing:Landroid/media/session/MediaController;

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->selected:Landroid/media/session/MediaController;

    .line 233
    :cond_35
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->updatePill()V

    .line 234
    return-void
.end method

.method private showDetails()V
    .registers 14

    .prologue
    const/high16 v5, 0x41c00000    # 24.0f

    const-wide/16 v2, 0x0

    const/4 v9, 0x0

    const/4 v8, 0x1

    const/4 v4, 0x0

    .line 302
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->activity()Landroid/app/Activity;

    move-result-object v10

    if-eqz v10, :cond_13

    invoke-virtual {v10}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 328
    :cond_13
    :goto_13
    return-void

    .line 303
    :cond_14
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v10}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 304
    invoke-direct {p0, v5}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v0

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {p0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v1

    invoke-direct {p0, v5}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v5

    const/high16 v6, 0x40800000    # 4.0f

    invoke-direct {p0, v6}, Lginlemon/flower/glance/SLGlanceIsland;->dp(F)I

    move-result v6

    invoke-virtual {v11, v0, v1, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 305
    const-string v0, "battery"

    invoke-direct {p0, v0, v8}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_5d

    iget v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->battery:I

    if-ltz v0, :cond_5d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Battery  \u00b7  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->battery:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "%"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v11, v0, v4}, Lginlemon/flower/glance/SLGlanceIsland;->addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 306
    :cond_5d
    const-string v0, "music"

    invoke-direct {p0, v0, v9}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_9a

    .line 307
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->selected:Landroid/media/session/MediaController;

    if-nez v0, :cond_109

    const-string v0, "No active music session"

    :goto_6b
    invoke-direct {p0, v11, v0, v4}, Lginlemon/flower/glance/SLGlanceIsland;->addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 308
    iget-object v12, p0, Lginlemon/flower/glance/SLGlanceIsland;->selected:Landroid/media/session/MediaController;

    .line 309
    if-eqz v12, :cond_9a

    .line 310
    invoke-virtual {v12}, Landroid/media/session/MediaController;->getPlaybackState()Landroid/media/session/PlaybackState;

    move-result-object v0

    .line 311
    if-nez v0, :cond_122

    move-wide v0, v2

    .line 312
    :goto_79
    iget-object v5, p0, Lginlemon/flower/glance/SLGlanceIsland;->playing:Landroid/media/session/MediaController;

    if-eqz v5, :cond_128

    move v5, v8

    .line 313
    :goto_7e
    if-eqz v5, :cond_12b

    const-wide/16 v6, 0x2

    :goto_82
    and-long/2addr v6, v0

    cmp-long v6, v6, v2

    if-nez v6, :cond_8e

    const-wide/16 v6, 0x200

    and-long/2addr v0, v6

    cmp-long v0, v0, v2

    if-eqz v0, :cond_9a

    .line 315
    :cond_8e
    if-eqz v5, :cond_12f

    const-string v0, "Pause music"

    :goto_92
    new-instance v1, Lginlemon/flower/glance/SLGlanceIsland$9;

    invoke-direct {v1, p0, v5, v12}, Lginlemon/flower/glance/SLGlanceIsland$9;-><init>(Lginlemon/flower/glance/SLGlanceIsland;ZLandroid/media/session/MediaController;)V

    invoke-direct {p0, v11, v0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 322
    :cond_9a
    const-string v0, "calendar"

    invoke-direct {p0, v0, v9}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_bc

    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->calendarAllowed()Z

    move-result v0

    if-eqz v0, :cond_14a

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->event:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_133

    const-string v0, "No event in the next hour"

    :goto_b2
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->calendarAllowed()Z

    move-result v1

    if-eqz v1, :cond_14e

    move-object v1, v4

    :goto_b9
    invoke-direct {p0, v11, v0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 323
    :cond_bc
    const-string v0, "agenda"

    invoke-direct {p0, v0, v8}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_d1

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->task:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_155

    const-string v0, "No open task for today"

    :goto_ce
    invoke-direct {p0, v11, v0, v4}, Lginlemon/flower/glance/SLGlanceIsland;->addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 324
    :cond_d1
    invoke-virtual {v11}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-nez v0, :cond_dc

    const-string v0, "Choose what to show in settings"

    invoke-direct {p0, v11, v0, v4}, Lginlemon/flower/glance/SLGlanceIsland;->addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 325
    :cond_dc
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, v10}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Smart Glance"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v11}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Done"

    .line 326
    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Settings"

    new-instance v2, Lginlemon/flower/glance/SLGlanceIsland$11;

    invoke-direct {v2, p0}, Lginlemon/flower/glance/SLGlanceIsland$11;-><init>(Lginlemon/flower/glance/SLGlanceIsland;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->dialog:Landroid/app/AlertDialog;

    .line 327
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_13

    .line 307
    :cond_109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u266b  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->musicTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_6b

    .line 311
    :cond_122
    invoke-virtual {v0}, Landroid/media/session/PlaybackState;->getActions()J

    move-result-wide v0

    goto/16 :goto_79

    :cond_128
    move v5, v9

    .line 312
    goto/16 :goto_7e

    .line 313
    :cond_12b
    const-wide/16 v6, 0x4

    goto/16 :goto_82

    .line 315
    :cond_12f
    const-string v0, "Play music"

    goto/16 :goto_92

    .line 322
    :cond_133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Upcoming  \u00b7  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->event:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_b2

    :cond_14a
    const-string v0, "Calendar permission needed"

    goto/16 :goto_b2

    :cond_14e
    new-instance v1, Lginlemon/flower/glance/SLGlanceIsland$10;

    invoke-direct {v1, p0}, Lginlemon/flower/glance/SLGlanceIsland$10;-><init>(Lginlemon/flower/glance/SLGlanceIsland;)V

    goto/16 :goto_b9

    .line 323
    :cond_155
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Today  \u00b7  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->task:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_ce
.end method

.method private showSettings()V
    .registers 11

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 339
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 359
    :cond_11
    :goto_11
    return-void

    .line 340
    :cond_12
    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "battery"

    aput-object v2, v1, v5

    const-string v2, "music"

    aput-object v2, v1, v6

    const-string v2, "calendar"

    aput-object v2, v1, v7

    const-string v2, "agenda"

    aput-object v2, v1, v8

    const-string v2, "bottom"

    aput-object v2, v1, v9

    .line 341
    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "Battery status"

    aput-object v3, v2, v5

    const-string v3, "Music (notification access)"

    aput-object v3, v2, v6

    const-string v3, "Upcoming calendar (permission required)"

    aput-object v3, v2, v7

    const-string v3, "Today\'s agenda tasks"

    aput-object v3, v2, v8

    const-string v3, "Move capsule to bottom"

    aput-object v3, v2, v9

    .line 342
    const/4 v3, 0x5

    new-array v3, v3, [Z

    const-string v4, "battery"

    invoke-direct {p0, v4, v6}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v4

    aput-boolean v4, v3, v5

    const-string v4, "music"

    invoke-direct {p0, v4, v5}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v4

    aput-boolean v4, v3, v6

    const-string v4, "calendar"

    invoke-direct {p0, v4, v5}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v4

    aput-boolean v4, v3, v7

    const-string v4, "agenda"

    invoke-direct {p0, v4, v6}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v4

    aput-boolean v4, v3, v8

    const-string v4, "bottom"

    invoke-direct {p0, v4, v5}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v4

    aput-boolean v4, v3, v9

    .line 343
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v5, "Glance settings"

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v5, Lginlemon/flower/glance/SLGlanceIsland$15;

    invoke-direct {v5, p0, v3}, Lginlemon/flower/glance/SLGlanceIsland$15;-><init>(Lginlemon/flower/glance/SLGlanceIsland;[Z)V

    invoke-virtual {v4, v2, v3, v5}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v4, "Save"

    new-instance v5, Lginlemon/flower/glance/SLGlanceIsland$14;

    invoke-direct {v5, p0, v1, v3, v0}, Lginlemon/flower/glance/SLGlanceIsland$14;-><init>(Lginlemon/flower/glance/SLGlanceIsland;[Ljava/lang/String;[ZLandroid/app/Activity;)V

    .line 344
    invoke-virtual {v2, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Cancel"

    const/4 v3, 0x0

    .line 354
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Notification access"

    new-instance v3, Lginlemon/flower/glance/SLGlanceIsland$13;

    invoke-direct {v3, p0, v0}, Lginlemon/flower/glance/SLGlanceIsland$13;-><init>(Lginlemon/flower/glance/SLGlanceIsland;Landroid/app/Activity;)V

    .line 355
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 357
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->dialog:Landroid/app/AlertDialog;

    .line 358
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_11
.end method

.method private start()V
    .registers 5

    .prologue
    const/4 v1, 0x1

    .line 177
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    if-eqz v0, :cond_6

    .line 191
    :goto_5
    return-void

    .line 178
    :cond_6
    iput-boolean v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    .line 179
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 180
    const-string v1, "android.intent.action.TIME_TICK"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.TIME_SET"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 181
    const-string v1, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.DATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 182
    :try_start_23
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->receiverRegistered:Z
    :try_end_2f
    .catch Ljava/lang/RuntimeException; {:try_start_23 .. :try_end_2f} :catch_58

    .line 184
    :goto_2f
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->agenda:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->agendaChanged:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 185
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->calendarAllowed()Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 186
    :try_start_3c
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/CalendarContract$Events;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    iget-object v3, p0, Lginlemon/flower/glance/SLGlanceIsland;->calendarChanged:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 187
    const/4 v0, 0x1

    iput-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->observerRegistered:Z
    :try_end_4f
    .catch Ljava/lang/RuntimeException; {:try_start_3c .. :try_end_4f} :catch_56

    .line 189
    :cond_4f
    :goto_4f
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->reconnectMedia()V

    .line 190
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->refreshData()V

    goto :goto_5

    .line 188
    :catch_56
    move-exception v0

    goto :goto_4f

    .line 183
    :catch_58
    move-exception v0

    goto :goto_2f
.end method

.method private stop()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 193
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    if-nez v0, :cond_6

    .line 200
    :cond_5
    :goto_5
    return-void

    .line 194
    :cond_6
    iput-boolean v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    iget v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->generation:I

    .line 195
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->receiverRegistered:Z

    if-eqz v0, :cond_1d

    :try_start_12
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_12 .. :try_end_1b} :catch_47

    :goto_1b
    iput-boolean v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->receiverRegistered:Z

    .line 196
    :cond_1d
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->agenda:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->agendaChanged:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 197
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->observerRegistered:Z

    if-eqz v0, :cond_37

    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->calendarChanged:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    iput-boolean v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->observerRegistered:Z

    .line 198
    :cond_37
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->unbindMedia()V

    .line 199
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->dialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->dialog:Landroid/app/AlertDialog;

    goto :goto_5

    .line 195
    :catch_47
    move-exception v0

    goto :goto_1b
.end method

.method private unbindMedia()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 205
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->mediaRegistered:Z

    if-eqz v0, :cond_13

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->media:Landroid/media/session/MediaSessionManager;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->media:Landroid/media/session/MediaSessionManager;

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->sessionsChanged:Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;

    invoke-virtual {v0, v1}, Landroid/media/session/MediaSessionManager;->removeOnActiveSessionsChangedListener(Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->mediaRegistered:Z

    .line 206
    :cond_13
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->controllers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/session/MediaController;

    iget-object v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->mediaChanged:Landroid/media/session/MediaController$Callback;

    invoke-virtual {v0, v2}, Landroid/media/session/MediaController;->unregisterCallback(Landroid/media/session/MediaController$Callback;)V

    goto :goto_19

    .line 207
    :cond_2b
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->controllers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iput-object v3, p0, Lginlemon/flower/glance/SLGlanceIsland;->playing:Landroid/media/session/MediaController;

    iput-object v3, p0, Lginlemon/flower/glance/SLGlanceIsland;->selected:Landroid/media/session/MediaController;

    .line 208
    return-void
.end method

.method private updateCalendarDisplay()V
    .registers 8

    .prologue
    .line 281
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 282
    iget-object v6, p0, Lginlemon/flower/glance/SLGlanceIsland;->calendarItem:Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    .line 283
    if-eqz v6, :cond_3e

    iget-wide v0, v6, Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;->begin:J

    iget-wide v2, v6, Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;->end:J

    invoke-static/range {v0 .. v5}, Lginlemon/flower/glance/SLGlancePolicy;->eventVisible(JJJ)Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 284
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/text/DateFormat;->getTimeInstance(I)Ljava/text/DateFormat;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    iget-wide v4, v6, Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;->begin:J

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v6, Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3b
    iput-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->event:Ljava/lang/String;

    .line 285
    return-void

    .line 284
    :cond_3e
    const-string v0, ""

    goto :goto_3b
.end method

.method private updatePill()V
    .registers 8

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 242
    iget v4, p0, Lginlemon/flower/glance/SLGlanceIsland;->battery:I

    const-string v0, "battery"

    invoke-direct {p0, v0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v5

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->playing:Landroid/media/session/MediaController;

    if-eqz v0, :cond_7e

    const-string v0, "music"

    .line 243
    invoke-direct {p0, v0, v2}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_7e

    move v0, v1

    :goto_17
    const-string v3, "calendar"

    invoke-direct {p0, v3, v2}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_80

    iget-object v3, p0, Lginlemon/flower/glance/SLGlanceIsland;->event:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_80

    move v3, v1

    :goto_28
    const-string v6, "agenda"

    .line 244
    invoke-direct {p0, v6, v1}, Lginlemon/flower/glance/SLGlanceIsland;->enabled(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_39

    iget-object v6, p0, Lginlemon/flower/glance/SLGlanceIsland;->task:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_39

    move v2, v1

    .line 242
    :cond_39
    invoke-static {v4, v5, v0, v3, v2}, Lginlemon/flower/glance/SLGlancePolicy;->choose(IZZZZ)I

    move-result v0

    .line 245
    if-ne v0, v1, :cond_82

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Battery "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->battery:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "%"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 247
    :goto_5a
    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Smart Glance: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->pill:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 249
    return-void

    :cond_7e
    move v0, v2

    .line 243
    goto :goto_17

    :cond_80
    move v3, v2

    goto :goto_28

    .line 245
    :cond_82
    const/4 v1, 0x2

    if-ne v0, v1, :cond_9d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u266b  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->musicTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5a

    .line 246
    :cond_9d
    const/4 v1, 0x3

    if-ne v0, v1, :cond_b6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u25f7  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->event:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5a

    :cond_b6
    const/4 v1, 0x4

    if-ne v0, v1, :cond_cf

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u2713  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland;->task:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5a

    :cond_cf
    const-string v0, "\u2726  Glance"

    goto :goto_5a
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 122
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 123
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->move()V

    .line 124
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 125
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 127
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 128
    :cond_11
    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->stop()V

    .line 129
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 130
    return-void
.end method

.method public onPreDraw()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 142
    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_3c

    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->isShown()Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, v0}, Lginlemon/flower/glance/SLGlanceIsland;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->rect:Landroid/graphics/Rect;

    .line 143
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    if-lt v0, v2, :cond_3c

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->rect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {p0}, Lginlemon/flower/glance/SLGlanceIsland;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    if-lt v0, v2, :cond_3c

    move v0, v1

    .line 144
    :goto_32
    if-eqz v0, :cond_3e

    iget-boolean v2, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    if-nez v2, :cond_3e

    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->start()V

    .line 146
    :cond_3b
    :goto_3b
    return v1

    .line 143
    :cond_3c
    const/4 v0, 0x0

    goto :goto_32

    .line 145
    :cond_3e
    if-nez v0, :cond_3b

    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    if-eqz v0, :cond_3b

    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->stop()V

    goto :goto_3b
.end method

.method public onWindowFocusChanged(Z)V
    .registers 3

    .prologue
    .line 136
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onWindowFocusChanged(Z)V

    .line 138
    if-eqz p1, :cond_f

    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland;->active:Z

    if-eqz v0, :cond_f

    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->stop()V

    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->start()V

    .line 139
    :cond_f
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .registers 2

    .prologue
    .line 132
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onWindowVisibilityChanged(I)V

    .line 133
    if-eqz p1, :cond_8

    invoke-direct {p0}, Lginlemon/flower/glance/SLGlanceIsland;->stop()V

    .line 134
    :cond_8
    return-void
.end method
