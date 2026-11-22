.class Lginlemon/flower/glance/SLGlanceIsland$8;
.super Ljava/lang/Object;
.source "SLGlanceIsland.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lginlemon/flower/glance/SLGlanceIsland;->refreshData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lginlemon/flower/glance/SLGlanceIsland;

.field final synthetic val$json:Ljava/lang/String;

.field final synthetic val$readCalendar:Z

.field final synthetic val$request:I


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;Ljava/lang/String;ZI)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 256
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$8;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    iput-object p2, p0, Lginlemon/flower/glance/SLGlanceIsland$8;->val$json:Ljava/lang/String;

    iput-boolean p3, p0, Lginlemon/flower/glance/SLGlanceIsland$8;->val$readCalendar:Z

    iput p4, p0, Lginlemon/flower/glance/SLGlanceIsland$8;->val$request:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 257
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$8;->val$json:Ljava/lang/String;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$1100(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 258
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland$8;->val$readCalendar:Z

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$8;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$1200(Lginlemon/flower/glance/SLGlanceIsland;)Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    move-result-object v0

    .line 259
    :goto_10
    iget-object v2, p0, Lginlemon/flower/glance/SLGlanceIsland$8;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v2}, Lginlemon/flower/glance/SLGlanceIsland;->access$1500(Lginlemon/flower/glance/SLGlanceIsland;)Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Lginlemon/flower/glance/SLGlanceIsland$8$1;

    invoke-direct {v3, p0, v1, v0}, Lginlemon/flower/glance/SLGlanceIsland$8$1;-><init>(Lginlemon/flower/glance/SLGlanceIsland$8;Ljava/lang/String;Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 263
    return-void

    .line 258
    :cond_1f
    const/4 v0, 0x0

    goto :goto_10
.end method
