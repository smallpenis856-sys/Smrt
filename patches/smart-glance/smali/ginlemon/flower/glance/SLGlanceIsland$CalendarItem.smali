.class final Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;
.super Ljava/lang/Object;
.source "SLGlanceIsland.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lginlemon/flower/glance/SLGlanceIsland;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CalendarItem"
.end annotation


# instance fields
.field final begin:J

.field final end:J

.field final title:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;JJ)V
    .registers 6

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;->title:Ljava/lang/String;

    iput-wide p2, p0, Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;->begin:J

    iput-wide p4, p0, Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;->end:J

    return-void
.end method
