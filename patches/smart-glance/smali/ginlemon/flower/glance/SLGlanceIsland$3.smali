.class Lginlemon/flower/glance/SLGlanceIsland$3;
.super Landroid/content/BroadcastReceiver;
.source "SLGlanceIsland.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lginlemon/flower/glance/SLGlanceIsland;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lginlemon/flower/glance/SLGlanceIsland;


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 2

    .prologue
    .line 148
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$3;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7

    .prologue
    const/4 v0, -0x1

    .line 150
    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland$3;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v1}, Lginlemon/flower/glance/SLGlanceIsland;->access$200(Lginlemon/flower/glance/SLGlanceIsland;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 160
    :goto_9
    return-void

    .line 151
    :cond_a
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 152
    const-string v1, "level"

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 153
    const-string v2, "scale"

    invoke-virtual {p2, v2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 154
    iget-object v3, p0, Lginlemon/flower/glance/SLGlanceIsland$3;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    if-ltz v1, :cond_31

    if-lez v2, :cond_31

    const/16 v0, 0x64

    mul-int/lit8 v1, v1, 0x64

    div-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_31
    invoke-static {v3, v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$302(Lginlemon/flower/glance/SLGlanceIsland;I)I

    .line 155
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$3;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$400(Lginlemon/flower/glance/SLGlanceIsland;)V

    goto :goto_9

    .line 156
    :cond_3a
    const-string v0, "android.intent.action.TIME_TICK"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6f

    .line 157
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$3;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$500(Lginlemon/flower/glance/SLGlanceIsland;)Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    move-result-object v0

    if-eqz v0, :cond_64

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$3;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$500(Lginlemon/flower/glance/SLGlanceIsland;)Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    move-result-object v0

    iget-wide v0, v0, Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;->end:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_64

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$3;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$600(Lginlemon/flower/glance/SLGlanceIsland;)V

    goto :goto_9

    .line 158
    :cond_64
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$3;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$700(Lginlemon/flower/glance/SLGlanceIsland;)V

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$3;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$400(Lginlemon/flower/glance/SLGlanceIsland;)V

    goto :goto_9

    .line 159
    :cond_6f
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$3;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$600(Lginlemon/flower/glance/SLGlanceIsland;)V

    goto :goto_9
.end method
