.class Lginlemon/flower/glance/SLGlanceIsland$8$1;
.super Ljava/lang/Object;
.source "SLGlanceIsland.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lginlemon/flower/glance/SLGlanceIsland$8;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lginlemon/flower/glance/SLGlanceIsland$8;

.field final synthetic val$nextEvent:Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

.field final synthetic val$nextTask:Ljava/lang/String;


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland$8;Ljava/lang/String;Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 259
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->this$1:Lginlemon/flower/glance/SLGlanceIsland$8;

    iput-object p2, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->val$nextTask:Ljava/lang/String;

    iput-object p3, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->val$nextEvent:Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 260
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->this$1:Lginlemon/flower/glance/SLGlanceIsland$8;

    iget-object v0, v0, Lginlemon/flower/glance/SLGlanceIsland$8;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$200(Lginlemon/flower/glance/SLGlanceIsland;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->this$1:Lginlemon/flower/glance/SLGlanceIsland$8;

    iget v0, v0, Lginlemon/flower/glance/SLGlanceIsland$8;->val$request:I

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->this$1:Lginlemon/flower/glance/SLGlanceIsland$8;

    iget-object v1, v1, Lginlemon/flower/glance/SLGlanceIsland$8;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v1}, Lginlemon/flower/glance/SLGlanceIsland;->access$1300(Lginlemon/flower/glance/SLGlanceIsland;)I

    move-result v1

    if-eq v0, v1, :cond_19

    .line 262
    :cond_18
    :goto_18
    return-void

    .line 261
    :cond_19
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->this$1:Lginlemon/flower/glance/SLGlanceIsland$8;

    iget-object v0, v0, Lginlemon/flower/glance/SLGlanceIsland$8;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->val$nextTask:Ljava/lang/String;

    invoke-static {v0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->access$1402(Lginlemon/flower/glance/SLGlanceIsland;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->this$1:Lginlemon/flower/glance/SLGlanceIsland$8;

    iget-object v0, v0, Lginlemon/flower/glance/SLGlanceIsland$8;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->val$nextEvent:Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    invoke-static {v0, v1}, Lginlemon/flower/glance/SLGlanceIsland;->access$502(Lginlemon/flower/glance/SLGlanceIsland;Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;)Lginlemon/flower/glance/SLGlanceIsland$CalendarItem;

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->this$1:Lginlemon/flower/glance/SLGlanceIsland$8;

    iget-object v0, v0, Lginlemon/flower/glance/SLGlanceIsland$8;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$700(Lginlemon/flower/glance/SLGlanceIsland;)V

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$8$1;->this$1:Lginlemon/flower/glance/SLGlanceIsland$8;

    iget-object v0, v0, Lginlemon/flower/glance/SLGlanceIsland$8;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$400(Lginlemon/flower/glance/SLGlanceIsland;)V

    goto :goto_18
.end method
