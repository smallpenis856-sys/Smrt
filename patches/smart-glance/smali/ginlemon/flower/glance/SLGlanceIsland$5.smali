.class Lginlemon/flower/glance/SLGlanceIsland$5;
.super Landroid/database/ContentObserver;
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
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;Landroid/os/Handler;)V
    .registers 3

    .prologue
    .line 167
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$5;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 3

    .prologue
    .line 168
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$5;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$200(Lginlemon/flower/glance/SLGlanceIsland;)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$5;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$600(Lginlemon/flower/glance/SLGlanceIsland;)V

    :cond_d
    return-void
.end method
